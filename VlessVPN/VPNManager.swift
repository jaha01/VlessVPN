//
//  VPNManager.swift
//  VlessVPN
//
//  Created by Jahongir Anvarov on 23.02.2025.
//

import XRayCoreIOSWrapper

final class VPNManager {
    static let shared = VPNManager() 
    
    private init() {}

    func startVPN() {
        let assetsDirectory = Bundle.main.bundlePath
        XRaySetXrayEnv("someKey", assetsDirectory)

        let vlessConfig = """
        {
            "log": { "loglevel": "info" },
            "inbounds": [{
                "port": 10808,
                "protocol": "socks",
                "settings": { "auth": "noauth" }
            }],
            "outbounds": [{
                "protocol": "vless",
                "settings": {
                    "vnext": [{
                        "address": "syd5.vpntype.dev",
                        "port": 443,
                        "users": [{
                            "id": "5c84e4b3-93e3-4a48-95fe-cf77fd6917b8",
                            "encryption": "none",
                            "flow": "xtls-rprx-vision"
                        }]
                    }]
                },
                "streamSettings": {
                    "network": "tcp",
                    "security": "tls",
                    "tlsSettings": {
                        "alpn": ["h2", "http/1.1"],
                        "allowInsecure": false
                    }
                }
            }]
        }
        """

        guard let configData = vlessConfig.data(using: .utf8) else {
            print("❌ Ошибка: некорректные данные конфигурации")
            return
        }

        XRayStartXray(configData, nil, nil)
        print("✅ VPN запущен!")
    }
}
