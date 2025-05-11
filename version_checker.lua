CreateThread(function()
    Wait(500) -- Wait a few seconds after the resource starts

    local resourceName = GetCurrentResourceName()
    local localVersion = GetResourceMetadata(resourceName, 'version', 0)

    PerformHttpRequest("https://api.github.com/repos/DasEntlein01/u_notify/releases/latest", function(statusCode, response, _)
        if statusCode ~= 200 then
            print("^1[⚠️ u_notify] Failed to fetch the latest version from GitHub. Status Code: " .. statusCode .. "^0")
            return
        end

        local success, data = pcall(json.decode, response)
        if not success or not data or not data.tag_name then
            print("^1[❌ u_notify] Failed to parse GitHub response.^0")
            return
        end

        local latestVersion = data.tag_name:gsub("^v", "")

        if localVersion ~= latestVersion then
            print("^3──────────────────────────────────────────────")
            print("^3🔔 ^1u_notify Update Available!^3")
            print("^3──────────────────────────────────────────────")
            print("^3📌 Current Version: ^0" .. localVersion)
            print("^3🚀 Latest Version: ^0" .. latestVersion)
            print("^3🔗 Download Update: ^0https://github.com/DasEntlein01/u_notify/releases/latest")
            print("^3──────────────────────────────────────────────")
        else
            print("^2──────────────────────────────────────────────")
            print("^2✅ u_notify is up to date!")
            print("^2📦 Version: " .. localVersion)
            print("^2──────────────────────────────────────────────")
        end
    end, "GET", "", {
        ["User-Agent"] = "FiveM-Version-Checker"
    })
end)
