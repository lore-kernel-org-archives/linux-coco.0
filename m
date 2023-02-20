Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2069.outbound.protection.outlook.com [40.107.96.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE618497
	for <linux-coco@lists.linux.dev>; Mon, 20 Feb 2023 19:01:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3QeESdQSv0mkXhHnGxlbaCVMgRnDuNnPvZoRgi7DS9ufUcPAHgHRErXCeX1Zz5aHqQnPhv7t3aQUCcF4byUsdZtNHkbKpZjhXlJ6OZJgIpNcGzeLQ3e9cSFCtWRuNh3h+dZ12rxYNcy4AMzRy25aF1KVdkyCHjMIO8u49Jrag6YSe8AXa22UOS62NB4NKQmn6JG76F7G1lWyFYT7rwMYhovz/rZxCDIxJ1WekDnTsf0SpRjJ5CZ8XJZR8mDTaFc8b3dVZFWti2wwnM4PL8p9TaPK59HNamGd8/Y0i9T+I2sPYIEsZm1DZS4VoJHdzdu3lvvOyx36S70mZyMa8tbfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUy6W8vUVLW4RDBTDQXfJAfbbqMreiqOl2cG+jRqR+Y=;
 b=mer7Kli3WQ5EXhGJ3Okgjt3cMExdqH79+fUYOmT9+lr7JRLCBnI2G1olqWnPX8Dkci3Q0wlRiNS3pfGSa5bQ/hfBpkQ1F9MPb1FE8sBFz361cyUx54hj4keMnrb6al/H6zFP2DKmWhMK5iN/lVQuX9zRZxSEFDjmmJ6Omot6eprdPTYmKmTOKiRmGl3l3Qk8NTQ8H3OwJZc8OwZyQNU1tzbhJkhpy6g7osn32c/1gdUy+SQBDfoJGDH0di8dQ3CPGZmPNj1WJByKrbtnQqyCQb58j64mDy/MFXH4MbkHhBJTZHa6EMTzFc9D58iQIwSoTMC9X+UzX5ME7fBFFVnixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUy6W8vUVLW4RDBTDQXfJAfbbqMreiqOl2cG+jRqR+Y=;
 b=Cb2UsjgQ/RBWvqQt5eI2XM4BxnS/AIHnHdkTDUBDAVDC7sRNKu4e2mFowcrzuleu7m0FqjywzJmYLP9VaYKa5OSnsXuiVhpC9Zyx6ulYIQBz+GzXe9yINMDO3+Dy5rsHfvHZ922LNLHKuS6BhgjeWw9ZfSb8au27UPSr3jatGn8=
Received: from MW4PR04CA0330.namprd04.prod.outlook.com (2603:10b6:303:82::35)
 by DM4PR12MB5214.namprd12.prod.outlook.com (2603:10b6:5:395::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 19:01:44 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::3b) by MW4PR04CA0330.outlook.office365.com
 (2603:10b6:303:82::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19 via Frontend
 Transport; Mon, 20 Feb 2023 19:01:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.20 via Frontend Transport; Mon, 20 Feb 2023 19:01:44 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 Feb
 2023 13:01:43 -0600
From: Michael Roth <michael.roth@amd.com>
To: <kvm@vger.kernel.org>
CC: <linux-coco@lists.linux.dev>, <linux-mm@kvack.org>,
	<linux-crypto@vger.kernel.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<jroedel@suse.de>, <thomas.lendacky@amd.com>, <hpa@zytor.com>,
	<ardb@kernel.org>, <pbonzini@redhat.com>, <seanjc@google.com>,
	<vkuznets@redhat.com>, <jmattson@google.com>, <luto@kernel.org>,
	<dave.hansen@linux.intel.com>, <slp@redhat.com>, <pgonda@google.com>,
	<peterz@infradead.org>, <srinivas.pandruvada@linux.intel.com>,
	<rientjes@google.com>, <dovmurik@linux.ibm.com>, <tobin@ibm.com>,
	<bp@alien8.de>, <vbabka@suse.cz>, <kirill@shutemov.name>,
	<ak@linux.intel.com>, <tony.luck@intel.com>, <marcorr@google.com>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <alpergun@google.com>,
	<dgilbert@redhat.com>, <jarkko@kernel.org>, <ashish.kalra@amd.com>,
	<nikunj.dadhania@amd.com>
Subject: [PATCH RFC v8 05/56] KVM: SEV: Require KVM_PROTECTED_VM when AMD_MEM_ENCRYPT is enabled
Date: Mon, 20 Feb 2023 12:37:56 -0600
Message-ID: <20230220183847.59159-6-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220183847.59159-1-michael.roth@amd.com>
References: <20230220183847.59159-1-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT027:EE_|DM4PR12MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb1b2ac-50fa-4e08-c53d-08db1374e8ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xojPAxrcNBewpydI4YiEKDyFbZhtWPhJ1J22Sh1ig6V+Y5PkLYDtldjbkMH4Xe9ML1HTqIP8gO9mkBRYFsAOpfFdld5jl6gDdIjcNhV+MtWbp8IKy5C0iCPMuoIj/2+Ii1jDHy/DHkza/pnyR0S00pKNj2/aExFEfBB5m4083ZXOI6mQPwyK8DEe/XTpW76wBwX7sHZhlHmmri12maIr2sJh/e1EjXqszbb9kUxZsRAjPprkCpnQF6ps40FpvBvgdUtLeVYAqlY1mhS42mbKKqaXmTnpOMZ/61NRnoroLY5x84O4qmBpOdUQ0fGMD+d7sc3Vc90V+9pYPGyANoqKdlCVGcZ2c15eZ3g8mTv2LFxVUoFEw+gA2I4E9zc77mgSl9iD7Xhig8hcJPavW+RMU5tPrSNyVwoeTnKWFy+Md3hHuxWM01+IgtsZTJ2D/OMz6SqYY3QW7LblahO7MP7WZerkKt4oaymju6yauG7Votk9/1w+EL4U49lwdXIhA3FzCU6oNtYlXA74vKL0keJZG3nfRvcMU4Qa9LmGzU1pmYZuaGlsTW5Vjyhpqhb72nQPKfjU6nmWnx7OpHiJHmGvYiNw0IgM1isd/YaK/ye9qCenATKgzYTIRlKuC9ByS/TR+IgJ72M3vXkagT3PJmIqFxKT2HIxYCUsp3UJqafokL68CkgNShJKR/ZCWOEeGw0MHUOyU0bCtXHjl5lkSgbQW+Hd710sYQuaUmu/D5silUw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(36860700001)(5660300002)(44832011)(7416002)(4744005)(7406005)(82310400005)(86362001)(82740400003)(2906002)(336012)(81166007)(40480700001)(36756003)(478600001)(186003)(26005)(47076005)(16526019)(426003)(40460700003)(356005)(316002)(70586007)(54906003)(4326008)(41300700001)(1076003)(70206006)(6666004)(8676002)(6916009)(8936002)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 19:01:44.6812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb1b2ac-50fa-4e08-c53d-08db1374e8ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5214

AMD_MEM_ENCRYPT implies SEV support, which now relies on support
provided by the KVM_PROTECTED_VM config option.

An argument can be made that SEV running in non-protected-VM-mode is
still possible, and so this should be configurable, but AMD_MEM_ENCRYPT
will also imply SEV-SNP, for which KVM_PROTECTED_VM is required in all
cases.

Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 67745ceab0db..f0d8f6bbc1a7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1546,6 +1546,7 @@ config AMD_MEM_ENCRYPT
 	select INSTRUCTION_DECODER
 	select ARCH_HAS_CC_PLATFORM
 	select X86_MEM_ENCRYPT
+	select KVM_PROTECTED_VM
 	help
 	  Say yes to enable support for the encryption of system memory.
 	  This requires an AMD processor that supports Secure Memory
-- 
2.25.1

