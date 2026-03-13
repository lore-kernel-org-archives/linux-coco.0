Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D1830C371
	for <linux-coco@lists.linux.dev>; Fri, 13 Mar 2026 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395214; cv=fail; b=dRAFPv93iQ5F/OTXhml78Qv94jr2B6PfqDfetDqI9wQyVa0bMPSzuLW34PfkYz9FNIojzekODmnLiaBDwCxvuWYzxqW/bKrx6Gm0GwYz9p27/51ZynWU9jJYN7/jFfJIn+mgSGLJ2hKSCA+eLh64+6FFquv3RJ/JlzqzuOFDZDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395214; c=relaxed/simple;
	bh=D7+iz0Zg/4zfxa878nb9SUSLV96qbBHGytz/AAtMQYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=N+HsF8VA59HwB99JdEEY4VNEF8DLSSIbtLZr6hyVLKlxvHHqEjNC7GopTSeLW1A3QEZUtySzRw4q8qs7cyo6cFKlXG8MvQb7GkklZE38TYXgctj1vEp+ea99Hh9MpAljJW7OO+CqUWEASzhT2kqYOZyOY1vr90Xs7tPOS3hOt5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n7fZYHmU; arc=fail smtp.client-ip=52.101.201.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n7fZYHmU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYahSMKTP4AqhiwxtAIoEhS/MBdSKUiJyASNoCopg1vHZuRpCvXWqEyPa3+ODjhtpnxOS2vu4lutTeuQBAB888hKuQD7Rx5dEgap8oiPBfhUK1wu3AMgLHGQJodRCuaptQgx1MpqI/RnbcTG5l6BKuGDyQbbCy5CfVimm3JzHRl1OgMgdHg1cYy9Z9SOzAlLUuaWTMfZejZyRpPou6YTMxPr7FOmpetm3+sSJqegGtrW/JQhgI2YGPO9ogEjelOrhIT97lDyxh4h9ENoG+gIok/ZUjWIfkHG03AnsNLe6OvqHTYGXEJtcVlsZalEGQN8M+QxPLeHiNkWia3wRro26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmqtIyU8u9IL2UHuFDv5caaQ90zuIDuuOU/Yu6OOftI=;
 b=liAnOEms1VwNo74wBOjycJu+TOKe6StOw5JrgpY6dBFboxTfhqNpTGSFBALROIZkIV0t4bPATmP0Dwmkb9kgFD9cGQApyeTt5fR4pKXouriT19e/AIQzBHmJwiVwzbn4E93KMb/6jYpJxl17lwrcHVUIU/lyB7gnUpCjUQkr5zP/KrofkgGM8gROX0Z/v0JbyV8GTdL75LmcF5UWDdoItnHQaCDZZzP1PnMpD61JX2dTh/l0gCC8IP+eXxjvHl9ADKaqTkp6vXZTHf2N+FZrv7vLEIOpQ0P7jrgF3ZxrkQoi5C7Aa22aRiGArVAPZlCOITXUY6qv6wBcNm3VvxX3mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmqtIyU8u9IL2UHuFDv5caaQ90zuIDuuOU/Yu6OOftI=;
 b=n7fZYHmU9k1bEfqyCy/Bc6P6ACrmdhraKvkk7P22bjjQY68aQFWM3Dpf75gRQWhk2+uiMqbulH2O7OluIq7YbcrNbCBGCk6ApH8EIsa0ky54BBOcAOU34cWKj+UIVAJm5SJMLHXCI3TLVy8ob7unD2a0gvUyPdMbL//f9kdqhsSVmmZacVj7fWfM0jHx3ips6GZWxUP2B+efVA9FRqT+tgBV45vCJ9WFReXP2c5awNVQFDkqNzaDqgj6YMj0PPLAHLc1ktu4wzFyAApfHOlhhprLsZRX4JUC5bMbg78wYzqSvND/oPAtTf3fbnp4CUgTlLs+YDIdKnYgij7l5/xOmw==
Received: from DS7PR03CA0246.namprd03.prod.outlook.com (2603:10b6:5:3b3::11)
 by BN7PPF62A0C9A68.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 09:46:41 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:5:3b3:cafe::c2) by DS7PR03CA0246.outlook.office365.com
 (2603:10b6:5:3b3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Fri,
 13 Mar 2026 09:46:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 09:46:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:46:21 -0700
Received: from [10.221.142.175] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:46:17 -0700
Message-ID: <19aeb934-7e36-4f30-8f7f-a8ae74a797f5@nvidia.com>
Date: Fri, 13 Mar 2026 11:46:14 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
To: Salman Nabi <salman.nabi@arm.com>, <vvidwans@nvidia.com>,
	<andre.przywara@arm.com>, <sudeep.holla@arm.com>, <mark.rutland@arm.com>,
	<lpieralisi@kernel.org>
CC: <ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <sdonthineni@nvidia.com>,
	<vsethi@nvidia.com>, <vwadekar@nvidia.com>
References: <20260119122729.287522-1-salman.nabi@arm.com>
 <20260119122729.287522-2-salman.nabi@arm.com>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <20260119122729.287522-2-salman.nabi@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|BN7PPF62A0C9A68:EE_
X-MS-Office365-Filtering-Correlation-Id: 40bd83d0-b047-4d00-c8ea-08de80e56d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|7416014|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DdyhErsnT3OE0UOLTHfhx0YU0dUJPeDHAwnA1Nbj1WJE50GZtRbG9TlCf3FHegOa4Aw9oWwtPJKt1zPNpXuXFMUGHgnul4n004e4XD1BPrSRyN2rQryYo8kGRaZVfZhKpBW6b5NMAPe9imne5jps+dYVxL+DbA4M3kI35rgvmwty+Izwu0nc/mN5jPpqWbKh0Zoqur4URxN2ClRIMAIeEMLIA6cZ6HDPjA7CkSaMUj1I9SzC/nxQQFXv/+WFJgJCcpicQfeCkAQPR9XgAf+RJYacPQj6MXr56Vrh1MNaSZP1HmRLdG3e/5qINoC77u4qkBduX+SA636xaxZO1RPVfUyGL7gv/9fgRopwtQQLQcyjQmR1UvCMrVK08ZcJmGzXPGV3wJcUna54bFBPHUZ+FLW6+/Q2RKT/+/mMw9WOQvAVoxaagV5qAlStGgrBYIYJGExp2HMRC8REGxdEs5ihAJ2BvwG6pMXU4AlIBV+fLgpKgKzsDo8yoJaBHwGPBDGhsFykiMN0J2ewKp4jj1oGk9NDEUtTDsSbg9qZT8l1ukSlMNNTvE0GBVzffgTcZy7j8TPkhwyEbLYIMoRYJ/gbtnfxE0VC7gqBAV/0YgHJbrYI7275rdcamyPCFEaRrXazZE4FX8NYaOOI3BlhNDwjkCkpozbptsBoWziNw12uHGA7fxXDj913Xo8lctQeP25AvpDHF1OBJSJ2Pt964tzPJ04vjWc648mvK29TbNiL7a+crQGds5XNjqJFS1TFYzx583quCprAotFgDvCKNkMJow==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(7416014)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rEU3gBnmcpgAu/OkH//jFVacv7nrlghxmRH5Uoq59bOLEiyIGco90RQJ7mQx3VD/5EMg/f1ppQ8vpnstP2aEgSuec5WY0VCiDlMBgK0TGD7YhwITUj3K8l+9dWJimP3Ne/UNA18DszSkr09pUkjTOoWPVeLdn5d7lVXfmONTs6VoE03TPtmXsxaOHKTFCVS0vsiVcl+WS9QJBwRr8E57Jl2jnUQXFAjHL1p5za83OcmlObVW5JMQNHioq6KPN1+ovyjDXYGlqsAwbqhl0IovO8yJvWvanS9wEcqK0K52KaNG5hBXlKHbtUkjaR9SNSBlzInycN774ajgebgKtCm4uthEVMvccHn995ZsQT8CKqdrqsiZokKhLBcVRsH9P2EXcD4gkQm3bBvCdIYxI17Ty5AKCMQxl/1Ej+yabfLdpt3SxziVY1DF3ziLTpcmZljs
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:46:40.5579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40bd83d0-b047-4d00-c8ea-08de80e56d8d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF62A0C9A68

Hi Salman and Andre,


We found an bug while testing LFA. See below:

On 19.01.26 14:27, Salman Nabi wrote:
> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
> activating firmware components without a reboot. Those components
> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
> usual way: via fwupd, FF-A or other secure storage methods, or via some
> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
> at system runtime, without requiring a reboot.
> The specification covers the SMCCC interface to list and query available
> components and eventually trigger the activation.
>
> Add a new directory under /sys/firmware to present firmware components
> capable of live activation. Each of them is a directory under lfa/,
> and is identified via its GUID. The activation will be triggered by echoing
> "1" into the "activate" file:
> ==========================================
> /sys/firmware/lfa # ls -l . 6c*
> .:
> total 0
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4
>
> 6c0762a6-12f2-4b56-92cb-ba8f633606d9:
> total 0
> --w-------    1 0        0             4096 Jan 19 11:33 activate
> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_capable
> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_pending
> --w-------    1 0        0             4096 Jan 19 11:33 cancel
> -r--r--r--    1 0        0             4096 Jan 19 11:33 cpu_rendezvous
> -r--r--r--    1 0        0             4096 Jan 19 11:33 current_version
> -rw-r--r--    1 0        0             4096 Jan 19 11:33 force_cpu_rendezvous
> -r--r--r--    1 0        0             4096 Jan 19 11:33 may_reset_cpu
> -r--r--r--    1 0        0             4096 Jan 19 11:33 name
> -r--r--r--    1 0        0             4096 Jan 19 11:33 pending_version
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # grep . *
> grep: activate: Permission denied
> activation_capable:1
> activation_pending:1
> grep: cancel: Permission denied
> cpu_rendezvous:1
> current_version:0.0
> force_cpu_rendezvous:1
> may_reset_cpu:0
> name:TF-RMM
> pending_version:0.0
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # echo 1 > activate
> [ 2825.797871] Arm LFA: firmware activation succeeded.
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 #
> ==========================================
>
> [1] https://developer.arm.com/documentation/den0147/latest/
>
> Signed-off-by: Salman Nabi <salman.nabi@arm.com>
> ---
>   drivers/firmware/smccc/Kconfig  |   8 +
>   drivers/firmware/smccc/Makefile |   1 +
>   drivers/firmware/smccc/lfa_fw.c | 668 ++++++++++++++++++++++++++++++++
>   3 files changed, 677 insertions(+)
>   create mode 100644 drivers/firmware/smccc/lfa_fw.c
>
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 15e7466179a6..ff7ca49486b0 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -23,3 +23,11 @@ config ARM_SMCCC_SOC_ID
>   	help
>   	  Include support for the SoC bus on the ARM SMCCC firmware based
>   	  platforms providing some sysfs information about the SoC variant.
> +
> +config ARM_LFA
> +	tristate "Arm Live Firmware activation support"
> +	depends on HAVE_ARM_SMCCC_DISCOVERY
> +	default y
> +	help
> +	  Include support for triggering Live Firmware Activation, which
> +	  allows to upgrade certain firmware components without a reboot.
> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
> index 40d19144a860..a6dd01558a94 100644
> --- a/drivers/firmware/smccc/Makefile
> +++ b/drivers/firmware/smccc/Makefile
> @@ -2,3 +2,4 @@
>   #
>   obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
>   obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
> +obj-$(CONFIG_ARM_LFA) += lfa_fw.o
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> new file mode 100644
> index 000000000000..ce54049b7190
> --- /dev/null
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -0,0 +1,668 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Arm Limited
> + */
> +
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/kobject.h>
> +#include <linux/module.h>
> +#include <linux/stop_machine.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/arm-smccc.h>
> +#include <linux/psci.h>
> +#include <uapi/linux/psci.h>
> +#include <linux/uuid.h>
> +#include <linux/array_size.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +
> +#undef pr_fmt
> +#define pr_fmt(fmt) "Arm LFA: " fmt
> +
> +/* LFA v1.0b0 specification */
> +#define LFA_1_0_FN_BASE			0xc40002e0
> +#define LFA_1_0_FN(n)			(LFA_1_0_FN_BASE + (n))
> +
> +#define LFA_1_0_FN_GET_VERSION		LFA_1_0_FN(0)
> +#define LFA_1_0_FN_CHECK_FEATURE	LFA_1_0_FN(1)
> +#define LFA_1_0_FN_GET_INFO		LFA_1_0_FN(2)
> +#define LFA_1_0_FN_GET_INVENTORY	LFA_1_0_FN(3)
> +#define LFA_1_0_FN_PRIME		LFA_1_0_FN(4)
> +#define LFA_1_0_FN_ACTIVATE		LFA_1_0_FN(5)
> +#define LFA_1_0_FN_CANCEL		LFA_1_0_FN(6)
> +
> +/* CALL_AGAIN flags (returned by SMC) */
> +#define LFA_PRIME_CALL_AGAIN		BIT(0)
> +#define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
> +
> +/* LFA return values */
> +#define LFA_SUCCESS			0
> +#define LFA_NOT_SUPPORTED		1
> +#define LFA_BUSY			2
> +#define LFA_AUTH_ERROR			3
> +#define LFA_NO_MEMORY			4
> +#define LFA_CRITICAL_ERROR		5
> +#define LFA_DEVICE_ERROR		6
> +#define LFA_WRONG_STATE			7
> +#define LFA_INVALID_PARAMETERS		8
> +#define LFA_COMPONENT_WRONG_STATE	9
> +#define LFA_INVALID_ADDRESS		10
> +#define LFA_ACTIVATION_FAILED		11
> +
> +#define LFA_ERROR_STRING(name) \
> +	[name] = #name
> +
> +static const char * const lfa_error_strings[] = {
> +	LFA_ERROR_STRING(LFA_SUCCESS),
> +	LFA_ERROR_STRING(LFA_NOT_SUPPORTED),
> +	LFA_ERROR_STRING(LFA_BUSY),
> +	LFA_ERROR_STRING(LFA_AUTH_ERROR),
> +	LFA_ERROR_STRING(LFA_NO_MEMORY),
> +	LFA_ERROR_STRING(LFA_CRITICAL_ERROR),
> +	LFA_ERROR_STRING(LFA_DEVICE_ERROR),
> +	LFA_ERROR_STRING(LFA_WRONG_STATE),
> +	LFA_ERROR_STRING(LFA_INVALID_PARAMETERS),
> +	LFA_ERROR_STRING(LFA_COMPONENT_WRONG_STATE),
> +	LFA_ERROR_STRING(LFA_INVALID_ADDRESS),
> +	LFA_ERROR_STRING(LFA_ACTIVATION_FAILED)
> +};
> +
> +enum image_attr_names {
> +	LFA_ATTR_NAME,
> +	LFA_ATTR_CURRENT_VERSION,
> +	LFA_ATTR_PENDING_VERSION,
> +	LFA_ATTR_ACT_CAPABLE,
> +	LFA_ATTR_ACT_PENDING,
> +	LFA_ATTR_MAY_RESET_CPU,
> +	LFA_ATTR_CPU_RENDEZVOUS,
> +	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
> +	LFA_ATTR_ACTIVATE,
> +	LFA_ATTR_CANCEL,
> +	LFA_ATTR_NR_IMAGES
> +};
> +
> +struct image_props {
> +	struct list_head image_node;
> +	const char *image_name;
> +	int fw_seq_id;
> +	u64 current_version;
> +	u64 pending_version;
> +	bool activation_capable;
> +	bool activation_pending;
> +	bool may_reset_cpu;
> +	bool cpu_rendezvous;
> +	bool cpu_rendezvous_forced;
> +	struct kobject *image_dir;
> +	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
> +};
> +static LIST_HEAD(lfa_fw_images);
> +
> +/* A UUID split over two 64-bit registers */
> +struct uuid_regs {
> +	u64 uuid_lo;
> +	u64 uuid_hi;
> +};
> +
> +static const struct fw_image_uuid {
> +	const char *name;
> +	const char *uuid;
> +} fw_images_uuids[] = {
> +	{
> +		.name = "TF-A BL31 runtime",
> +		.uuid = "47d4086d-4cfe-9846-9b95-2950cbbd5a00",
> +	},
> +	{
> +		.name = "BL33 non-secure payload",
> +		.uuid = "d6d0eea7-fcea-d54b-9782-9934f234b6e4",
> +	},
> +	{
> +		.name = "TF-RMM",
> +		.uuid = "6c0762a6-12f2-4b56-92cb-ba8f633606d9",
> +	},
> +};
> +
> +static struct kobject *lfa_dir;
> +static DEFINE_MUTEX(lfa_lock);
> +static struct workqueue_struct *fw_images_update_wq;
> +static struct work_struct fw_images_update_work;
> +
> +static int update_fw_images_tree(void);
> +
> +static void delete_fw_image_node(struct image_props *attrs)
> +{
> +	int i;
> +
> +	for (i = 0; i < LFA_ATTR_NR_IMAGES; i++)
> +		sysfs_remove_file(attrs->image_dir, &attrs->image_attrs[i].attr);
> +
> +	kobject_put(attrs->image_dir);
> +	list_del(&attrs->image_node);
> +	kfree(attrs);
> +}
> +
> +static void remove_invalid_fw_images(struct work_struct *work)
> +{
> +	struct image_props *attrs, *tmp;
> +
> +	mutex_lock(&lfa_lock);
> +
> +	/*
> +	 * Remove firmware images including directories that are no longer
> +	 * present in the LFA agent after updating the existing ones.
> +	 */
> +	list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node) {
> +		if (attrs->fw_seq_id == -1)
> +			delete_fw_image_node(attrs);
> +	}
> +
> +	mutex_unlock(&lfa_lock);
> +}
> +
> +static void set_image_flags(struct image_props *attrs, int seq_id,
> +			    u32 image_flags, u64 reg_current_ver,
> +			    u64 reg_pending_ver)
> +{
> +	attrs->fw_seq_id = seq_id;
> +	attrs->current_version = reg_current_ver;
> +	attrs->pending_version = reg_pending_ver;
> +	attrs->activation_capable = !!(image_flags & BIT(0));
> +	attrs->activation_pending = !!(image_flags & BIT(1));
> +	attrs->may_reset_cpu = !!(image_flags & BIT(2));
> +	/* cpu_rendezvous_optional bit has inverse logic in the spec */
> +	attrs->cpu_rendezvous = !(image_flags & BIT(3));
> +}
> +
> +static unsigned long get_nr_lfa_components(void)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	reg.a0 = LFA_1_0_FN_GET_INFO;
> +	reg.a1 = 0; /* lfa_info_selector = 0 */
> +
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 != LFA_SUCCESS)
> +		return reg.a0;
> +
> +	return reg.a1;
> +}
> +
> +static int lfa_cancel(void *data)
> +{
> +	struct image_props *attrs = data;
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	reg.a0 = LFA_1_0_FN_CANCEL;
> +	reg.a1 = attrs->fw_seq_id;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +
> +	/*
> +	 * When firmware activation is called with "skip_cpu_rendezvous=1",
> +	 * LFA_CANCEL can fail with LFA_BUSY if the activation could not be
> +	 * cancelled.
> +	 */
> +	if (reg.a0 == LFA_SUCCESS) {
> +		pr_info("Activation cancelled for image %s\n",
> +			attrs->image_name);
> +	} else {
> +		pr_err("Firmware activation could not be cancelled: %s\n",
> +		       lfa_error_strings[-reg.a0]);
> +		return -EINVAL;
> +	}
> +
> +	return reg.a0;
> +}
> +
> +static int call_lfa_activate(void *data)
> +{
> +	struct image_props *attrs = data;
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	reg.a0 = LFA_1_0_FN_ACTIVATE;
> +	reg.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
> +	/*
> +	 * As we do not support updates requiring a CPU reset (yet),
> +	 * we pass 0 in reg.a3 and reg.a4, holding the entry point and context
> +	 * ID respectively.
> +	 * cpu_rendezvous_forced is set by the administrator, via sysfs,
> +	 * cpu_rendezvous is dictated by each firmware component.
> +	 */
> +	reg.a2 = !(attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous);
> +
> +	for (;;) {
> +		arm_smccc_1_2_invoke(&reg, &reg);
> +
> +		if ((long)reg.a0 < 0) {
> +			pr_err("ACTIVATE for image %s failed: %s\n",
> +				attrs->image_name, lfa_error_strings[-reg.a0]);
> +			return reg.a0;
> +		}
> +		if (!(reg.a1 & LFA_ACTIVATE_CALL_AGAIN))
> +			break; /* ACTIVATE successful */
> +	}
> +
> +	return reg.a0;
> +}
> +
> +static int activate_fw_image(struct image_props *attrs)
> +{
> +	int ret;
> +
> +	mutex_lock(&lfa_lock);
> +	if (attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous)
> +		ret = stop_machine(call_lfa_activate, attrs, cpu_online_mask);
> +	else
> +		ret = call_lfa_activate(attrs);
> +
> +	if (ret != 0) {
> +		mutex_unlock(&lfa_lock);
> +		return lfa_cancel(attrs);
> +	}
> +
> +	/*
> +	 * Invalidate fw_seq_ids (-1) for all images as the seq_ids and the
> +	 * number of firmware images in the LFA agent may change after a
> +	 * successful activation attempt. Negate all image flags as well.
> +	 */
> +	attrs = NULL;
> +	list_for_each_entry(attrs, &lfa_fw_images, image_node) {
> +		set_image_flags(attrs, -1, 0b1000, 0, 0);
> +	}
> +
> +	update_fw_images_tree();
> +
> +	/*
> +	 * Removing non-valid image directories at the end of an activation.
> +	 * We can't remove the sysfs attributes while in the respective
> +	 * _store() handler, so have to postpone the list removal to a
> +	 * workqueue.
> +	 */
> +	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);


This can get invoke multiple times so re-initializing a work item that 
may already be queued or running

is unsafe. This should be moved to lfa_init() so it is only called once. 
I suggest:

diff --git a/drivers/firmware/smccc/lfa_fw.c 
b/drivers/firmware/smccc/lfa_fw.c
index 90727a66e49a5..135358113104c 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -653,7 +653,6 @@ static int update_fw_images_tree(void)
          * _store() handler, so have to postpone the list removal to a
          * workqueue.
          */
-       INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
         queue_work(fw_images_update_wq, &fw_images_update_work);

         return 0;
@@ -680,7 +679,7 @@ static void lfa_notify_handler(acpi_handle handle, 
u32 event, void *data)
          * of all activable and pending images.
          */
         do {
-               /* Reset activable image flag */
+               flush_workqueue(fw_images_update_wq);
                 found_activable_image = false;
                 list_for_each_entry(attrs, &lfa_fw_images, image_node) {
                         if (attrs->fw_seq_id == -1)
@@ -782,6 +781,8 @@ static int __init lfa_init(void)
                 return -ENOMEM;
         }

+       INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
+
         pr_info("Live Firmware Activation: detected v%ld.%ld\n",
                 reg.a0 >> 16, reg.a0 & 0xffff);


Regards,

Nirmoy

> +	queue_work(fw_images_update_wq, &fw_images_update_work);
> +	mutex_unlock(&lfa_lock);
> +
> +	return ret;
> +}
> +
> +static int prime_fw_image(struct image_props *attrs)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	int ret;
> +
> +	mutex_lock(&lfa_lock);
> +	/* Avoid SMC calls on invalid firmware images */
> +	if (attrs->fw_seq_id == -1) {
> +		pr_err("Arm LFA: Invalid firmware sequence id\n");
> +		mutex_unlock(&lfa_lock);
> +
> +		return -ENODEV;
> +	}
> +
> +	if (attrs->may_reset_cpu) {
> +		pr_err("CPU reset not supported by kernel driver\n");
> +		mutex_unlock(&lfa_lock);
> +
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * LFA_PRIME/ACTIVATE will return 1 in reg.a1 if the firmware
> +	 * priming/activation is still in progress. In that case
> +	 * LFA_PRIME/ACTIVATE will need to be called again.
> +	 * reg.a1 will become 0 once the prime/activate process completes.
> +	 */
> +	reg.a0 = LFA_1_0_FN_PRIME;
> +	reg.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
> +	for (;;) {
> +		arm_smccc_1_2_invoke(&reg, &reg);
> +
> +		if ((long)reg.a0 < 0) {
> +			pr_err("LFA_PRIME for image %s failed: %s\n",
> +				attrs->image_name, lfa_error_strings[-reg.a0]);
> +			mutex_unlock(&lfa_lock);
> +
> +			return reg.a0;
> +		}
> +		if (!(reg.a1 & LFA_PRIME_CALL_AGAIN)) {
> +			ret = 0;
> +			break; /* PRIME successful */
> +		}
> +	}
> +
> +	mutex_unlock(&lfa_lock);
> +	return ret;
> +}
> +
> +static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +						 image_attrs[LFA_ATTR_NAME]);
> +
> +	return sysfs_emit(buf, "%s\n", attrs->image_name);
> +}
> +
> +static ssize_t activation_capable_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_ACT_CAPABLE]);
> +
> +	return sysfs_emit(buf, "%d\n", attrs->activation_capable);
> +}
> +
> +static ssize_t activation_pending_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_ACT_PENDING]);
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	/*
> +	 * Activation pending status can change anytime thus we need to update
> +	 * and return its current value
> +	 */
> +	reg.a0 = LFA_1_0_FN_GET_INVENTORY;
> +	reg.a1 = attrs->fw_seq_id;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 == LFA_SUCCESS)
> +		attrs->activation_pending = !!(reg.a3 & BIT(1));
> +
> +	return sysfs_emit(buf, "%d\n", attrs->activation_pending);
> +}
> +
> +static ssize_t may_reset_cpu_show(struct kobject *kobj,
> +				  struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_MAY_RESET_CPU]);
> +
> +	return sysfs_emit(buf, "%d\n", attrs->may_reset_cpu);
> +}
> +
> +static ssize_t cpu_rendezvous_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_CPU_RENDEZVOUS]);
> +
> +	return sysfs_emit(buf, "%d\n", attrs->cpu_rendezvous);
> +}
> +
> +static ssize_t force_cpu_rendezvous_store(struct kobject *kobj,
> +					  struct kobj_attribute *attr,
> +					  const char *buf, size_t count)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +				image_attrs[LFA_ATTR_FORCE_CPU_RENDEZVOUS]);
> +	int ret;
> +
> +	ret = kstrtobool(buf, &attrs->cpu_rendezvous_forced);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t force_cpu_rendezvous_show(struct kobject *kobj,
> +					 struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +				image_attrs[LFA_ATTR_FORCE_CPU_RENDEZVOUS]);
> +
> +	return sysfs_emit(buf, "%d\n", attrs->cpu_rendezvous_forced);
> +}
> +
> +static ssize_t current_version_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +				image_attrs[LFA_ATTR_CURRENT_VERSION]);
> +	u32 maj, min;
> +
> +	maj = attrs->current_version >> 32;
> +	min = attrs->current_version & 0xffffffff;
> +	return sysfs_emit(buf, "%u.%u\n", maj, min);
> +}
> +
> +static ssize_t pending_version_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_ACT_PENDING]);
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	u32 maj, min;
> +
> +	/*
> +	 * Similar to activation pending, this value can change following an
> +	 * update, we need to retrieve fresh info instead of stale information.
> +	 */
> +	reg.a0 = LFA_1_0_FN_GET_INVENTORY;
> +	reg.a1 = attrs->fw_seq_id;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 == LFA_SUCCESS) {
> +		if (reg.a5 != 0 && attrs->activation_pending)
> +		{
> +			attrs->pending_version = reg.a5;
> +			maj = reg.a5 >> 32;
> +			min = reg.a5 & 0xffffffff;
> +		}
> +	}
> +
> +	return sysfs_emit(buf, "%u.%u\n", maj, min);
> +}
> +
> +static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_ACTIVATE]);
> +	int ret;
> +
> +	ret = prime_fw_image(attrs);
> +	if (ret) {
> +		pr_err("Firmware prime failed: %s\n",
> +			lfa_error_strings[-ret]);
> +		return -ECANCELED;
> +	}
> +
> +	ret = activate_fw_image(attrs);
> +	if (ret) {
> +		pr_err("Firmware activation failed: %s\n",
> +			lfa_error_strings[-ret]);
> +		return -ECANCELED;
> +	}
> +
> +	pr_info("Firmware activation succeeded\n");
> +
> +	return count;
> +}
> +
> +static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +						 image_attrs[LFA_ATTR_CANCEL]);
> +	int ret;
> +
> +	ret = lfa_cancel(attrs);
> +	if (ret != 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
> +	[LFA_ATTR_NAME]			= __ATTR_RO(name),
> +	[LFA_ATTR_CURRENT_VERSION]	= __ATTR_RO(current_version),
> +	[LFA_ATTR_PENDING_VERSION]	= __ATTR_RO(pending_version),
> +	[LFA_ATTR_ACT_CAPABLE]		= __ATTR_RO(activation_capable),
> +	[LFA_ATTR_ACT_PENDING]		= __ATTR_RO(activation_pending),
> +	[LFA_ATTR_MAY_RESET_CPU]	= __ATTR_RO(may_reset_cpu),
> +	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
> +	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
> +	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
> +	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
> +};
> +
> +static void clean_fw_images_tree(void)
> +{
> +	struct image_props *attrs, *tmp;
> +
> +	list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node)
> +		delete_fw_image_node(attrs);
> +}
> +
> +static int update_fw_image_node(char *fw_uuid, int seq_id,
> +					  u32 image_flags, u64 reg_current_ver,
> +					  u64 reg_pending_ver)
> +{
> +	const char *image_name = "(unknown)";
> +	struct image_props *attrs;
> +	int ret;
> +
> +	/*
> +	 * If a fw_image is already in the images list then we just update
> +	 * its flags and seq_id instead of trying to recreate it.
> +	 */
> +	list_for_each_entry(attrs, &lfa_fw_images, image_node) {
> +		if (!strcmp(attrs->image_dir->name, fw_uuid)) {
> +			set_image_flags(attrs, seq_id, image_flags,
> +					reg_current_ver, reg_pending_ver);
> +			return 0;
> +		}
> +	}
> +
> +	attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
> +	if (!attrs)
> +		return -ENOMEM;
> +
> +	for (int i = 0; i < ARRAY_SIZE(fw_images_uuids); i++) {
> +		if (!strcmp(fw_images_uuids[i].uuid, fw_uuid))
> +			image_name = fw_images_uuids[i].name;
> +	}
> +
> +	attrs->image_dir = kobject_create_and_add(fw_uuid, lfa_dir);
> +	if (!attrs->image_dir)
> +		return -ENOMEM;
> +
> +	INIT_LIST_HEAD(&attrs->image_node);
> +	attrs->image_name = image_name;
> +	attrs->cpu_rendezvous_forced = 1;
> +	set_image_flags(attrs, seq_id, image_flags, reg_current_ver,
> +			reg_pending_ver);
> +
> +	/*
> +	 * The attributes for each sysfs file are constant (handler functions,
> +	 * name and permissions are the same within each directory), but we
> +	 * need a per-directory copy regardless, to get a unique handle
> +	 * for each directory, so that container_of can do its magic.
> +	 * Also this requires an explicit sysfs_attr_init(), since it's a new
> +	 * copy, to make LOCKDEP happy.
> +	 */
> +	memcpy(attrs->image_attrs, image_attrs_group,
> +	       sizeof(attrs->image_attrs));
> +	for (int i = 0; i < LFA_ATTR_NR_IMAGES; i++) {
> +		struct attribute *attr = &attrs->image_attrs[i].attr;
> +
> +		sysfs_attr_init(attr);
> +		ret = sysfs_create_file(attrs->image_dir, attr);
> +		if (ret) {
> +			pr_err("creating sysfs file for uuid %s: %d\n",
> +			       fw_uuid, ret);
> +			clean_fw_images_tree();
> +
> +			return ret;
> +		}
> +	}
> +	list_add(&attrs->image_node, &lfa_fw_images);
> +
> +	return ret;
> +}
> +
> +static int update_fw_images_tree(void)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	struct uuid_regs image_uuid;
> +	char image_id_str[40];
> +	int ret, num_of_components;
> +
> +	num_of_components = get_nr_lfa_components();
> +	if (num_of_components <= 0) {
> +		pr_err("Error getting number of LFA components\n");
> +		return -ENODEV;
> +	}
> +
> +	for (int i = 0; i < num_of_components; i++) {
> +		reg.a0 = LFA_1_0_FN_GET_INVENTORY;
> +		reg.a1 = i; /* fw_seq_id under consideration */
> +		arm_smccc_1_2_invoke(&reg, &reg);
> +		if (reg.a0 == LFA_SUCCESS) {
> +			image_uuid.uuid_lo = reg.a1;
> +			image_uuid.uuid_hi = reg.a2;
> +
> +			snprintf(image_id_str, sizeof(image_id_str), "%pUb",
> +				 &image_uuid);
> +			ret = update_fw_image_node(image_id_str, i,
> +							reg.a3, reg.a4, reg.a5);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int __init lfa_init(void)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	int err;
> +
> +	reg.a0 = LFA_1_0_FN_GET_VERSION;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 == -LFA_NOT_SUPPORTED) {
> +		pr_info("Live Firmware activation: no firmware agent found\n");
> +		return -ENODEV;
> +	}
> +
> +	fw_images_update_wq = alloc_workqueue("fw_images_update_wq",
> +					     WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
> +	if (!fw_images_update_wq) {
> +		pr_err("Live Firmware Activation: Failed to allocate workqueue.\n");
> +
> +		return -ENOMEM;
> +	}
> +
> +	pr_info("Live Firmware Activation: detected v%ld.%ld\n",
> +		reg.a0 >> 16, reg.a0 & 0xffff);
> +
> +	lfa_dir = kobject_create_and_add("lfa", firmware_kobj);
> +	if (!lfa_dir)
> +		return -ENOMEM;
> +
> +	mutex_lock(&lfa_lock);
> +	err = update_fw_images_tree();
> +	if (err != 0)
> +		kobject_put(lfa_dir);
> +
> +	mutex_unlock(&lfa_lock);
> +	return err;
> +}
> +module_init(lfa_init);
> +
> +static void __exit lfa_exit(void)
> +{
> +	flush_workqueue(fw_images_update_wq);
> +	destroy_workqueue(fw_images_update_wq);
> +
> +	mutex_lock(&lfa_lock);
> +	clean_fw_images_tree();
> +	mutex_unlock(&lfa_lock);
> +
> +	kobject_put(lfa_dir);
> +}
> +module_exit(lfa_exit);
> +
> +MODULE_DESCRIPTION("ARM Live Firmware Activation (LFA)");
> +MODULE_LICENSE("GPL");
