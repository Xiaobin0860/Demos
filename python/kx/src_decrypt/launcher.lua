if jit and jit.off then print("jit.off") jit.off() end

if __WP8 then require "bit" end

require "zoo.util.PublishActUtil"
require "hecore.utils"
require "hecore.ResourceLoader"
require "zoo.util.DcUtil"
require "zoo.util.UdidUtil"
require "zoo.util.SignatureUtil"
require "zoo.util.CommonAlertUtil"
require "hecore.gsp.GspProxy"
require "zoo.util.PrepackageUtil"

ResourceLoader.init()

math.randomseed( os.time() )
_G.kUseSmallResource = true
_G.kScreenWidthDefault = 720
_G.kScreenHeightDefault = 1280
_G.kDefaultSocialPlatform = "ios_all"
_G.kUserLogin = false
_G.isLocalDevelopMode = StartupConfig:getInstance():isLocalDevelopMode()
_G.bundleVersion = MetaInfo:getInstance():getApkVersion()
_G.__use_low_effect = false
_G.launcherVerion = 1
_G.enableSilentDynamicUpdate = true
_G.packageName = MetaInfo:getInstance():getPackageName() 
_G.useSmallResConfig = false
_G.enableMdoPayement = true
_G.kUserSNSLogin = false

local isEmulator = false

if not isLocalDevelopMode then print = function() end end

---------------------------------------------------------------------------------  Resource Initialize
if __WP8 then
    _G.__use_low_effect = true
    _G.kDefaultSocialPlatform = "windowsphone"
    _G.kUserLogin = false
    _G.enableSilentDynamicUpdate = true
    _G.requireConnectSDK = false
    _G.useSmallResConfig = false
    _G.kUserSNSLogin = false
    _G.disableActivity = true
    HeDCLog:getInstance():setDcUniqueKey("animal_wpcn_prod")
    HeDCLog:getInstance():setStore(_G.kDefaultSocialPlatform)
    HeDCLog:getInstance():setPlatform(_G.kDefaultSocialPlatform)
    if not __DEBUG then print = function() end end
elseif __ANDROID then
    local notificationUtil = luajava.bindClass("com.happyelements.hellolua.share.NotificationUtil")
    notificationUtil:onLuaStartup()
    print("runGame():notificationUtil:onLuaStartup()")

    _G.signatured = SignatureUtil:verifySignature( packageName )
    print("signatured:"..tostring(signatured))

    local function checkEmulator()
        local qemuFile = luajava.newInstance("java.io.File", "/system/lib/libc_malloc_debug_qemu.so")
        local mtpFile = luajava.newInstance("java.io.File", "/dev/mtp_usb")
        local accessoryFile = luajava.newInstance("java.io.File", "/dev/usb_accessory")
        if qemuFile:exists() and not mtpFile:exists() and not accessoryFile:exists() then
            isEmulator = true
        end
    end
    pcall(checkEmulator)

    -- GspProxy:setGameUserId("12345") 
elseif __IOS then
    _G.__IOS_QQ = true
    GspEnvironment:getInstance():setGameUserId("12345")
elseif __WIN32 then
    _G.bundleVersion = "1.13"
end

HeGameDefault:setUserId("12345")
HeGameDefault:setCheckSumFactor("t*1%7z^opd@awe2&c")

---------------------------------------------------------------------------------  Startup
local function startGameDirectly()
    require "hecore.utils"
    require "hecore.ResourceLoader"
    require "zoo.util.DcUtil"
    require "zoo.util.UdidUtil"
    require "zoo.util.SignatureUtil"

    require "hecore.WrapAssert"
    require "zoo.common.LogService"
    require "zoo.config.PlatformConfig"
    require "zoo.MainApplication"
end

local function startGameAfterDynamicUpdate()
    local function unrequire(m)
        if m == "hecore.lua_debugger" or m == "hecore.mobdebug" then return end
        package.loaded[m] = nil
        _G[m] = nil
        print("unrequire:"..m)
    end

    local function beginWithString(String,Start)
        return string.sub(String,1,string.len(Start))==Start
    end

    -- 动态更新后需要unrequire之前加载的lua,加载新的lua
    for k,v in pairs(package.loaded) do
        local packageName = tostring(k) or ""
        if beginWithString(packageName, "zoo.") or beginWithString(packageName, "hecore.") then unrequire(packageName) end
    end
    
    startGameDirectly()
end

local function dynamicUpdate()
    local dynamicUpdateProcessor = require("zoo.loader.DynamicUpdateProcessor")
    dynamicUpdateProcessor:start(startGameAfterDynamicUpdate, startGameDirectly)
end

local function trafficAlert()
    DcUtil:install()
    local trafficAlertProcessor = require("zoo.loader.TrafficAlertProcessor")
    trafficAlertProcessor:start(dynamicUpdate)
end

local function prePackageCheck()
    PrepackageUtil:prePackageCheck(trafficAlert)
end

local function lowDeviceDetect()
    local lowDeviceDetectProcessor = require("zoo.loader.LowDeviceDetectProcessor")
    lowDeviceDetectProcessor:start(prePackageCheck)
end

if __ANDROID and isEmulator then
    local builder = luajava.bindClass("com.happyelements.hellolua.share.DisplayUtil")
    builder:toast("开心消消乐暂时不支持在模拟器上运行！")
else
    lowDeviceDetect()
end