# gcp-enterprise-landing-zone
Organization (543675347962)

├── Security-Network
│   ├── lz-shared-vpc-host
│   ├── lz-logging
│   └── lz-security
│
├── NonProd
│   ├── lz-dev
│   ├── lz-qa
│   └── lz-sandbox
│
└── Prod
    ├── lz-prod-app
    └── lz-prod-data


lz-shared-vpc-host
│
└── enterprise-vpc
     │
     ├── prod-subnet
     │    10.10.0.0/20
     │
     ├── nonprod-subnet
     │    10.20.0.0/20
     │
     └── management-subnet
          10.30.0.0/24
