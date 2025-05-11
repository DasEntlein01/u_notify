CreateThread(function()
    Wait(3000) -- Give it a few seconds after the resource starts

    local resourceName = GetCurrentResourceName()
    local localVersion = GetResourceMetadata(resourceName, 'version', 0)

    PerformHttpRequest("https://api.github.com/repos/DasEntlein01/u_notify/releases/latest", function(statusCode, response, _)
        if statusCode ~= 200 then
            print("^1[u_notify] Failed to fetch the latest version from GitHub. Status Code: " .. statusCode .. "^0")
            return
        end

        local success, data = pcall(json.decode, response)
        if not success or not data or not data.tag_name then
            print("^1[u_notify] Failed to parse GitHub response.^0")
            return
        end

        local latestVersion = data.tag_name:gsub("^v", "") -- remove 'v' if version is like "v1.0.1"

        if localVersion ~= latestVersion then
            print("^3[u_notify] A new version is available!^0")
            print("^3Current version: ^0" .. localVersion)
            print("^3Latest version: ^0" .. latestVersion)
            print("^3Update here: https://github.com/DasEntlein01/u_notify/releases/latest^0")
        else
            print("^2[u_notify] You are using the latest version (" .. localVersion .. ")^0")
        end
    end, "GET", "", {
        ["User-Agent"] = "FiveM-Version-Checker"
    })
end)