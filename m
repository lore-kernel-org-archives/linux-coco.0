Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55C91A4F1D
	for <linux-coco@lists.linux.dev>; Thu, 20 Jun 2024 17:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904337; cv=fail; b=Dr7Z+wcwoGfFqgEfTzSdObDIYBXBRZiE1olWZw1KTloWZ6oiOHfnapj4Ja3cLwdEzBEy6WIiFVMyDOym3zEM+prx/wDLlYNFDf8DfQNr2SMcJHUjRT/yDhzDoewq0GV0puGXdAl3W4FI6Ogyl7/kKaYJhqYDZzeT3TKcCiS+Nnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904337; c=relaxed/simple;
	bh=q3woDyVUgYKwPLNq1Irdx07TDfKbT7UUuU6xpU152uM=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=oBdO2JxuN+tI1315zmMd9luO9xwN4PUXvuKUnsyOKxvHfrsi39ppRaLYlHm/NDdyKci+Uou5RBEhVWfURFdys/M4F3NCV1nik2Ig8/OnxtfAlPUtJr6nyGekQ2Bscch4gdkqZzatigSItKw/X4g8YxZeuNAattlssH4/XNcKzA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AH+YLm2X; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AH+YLm2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718904336; x=1750440336;
  h=date:from:to:subject:message-id:mime-version;
  bh=q3woDyVUgYKwPLNq1Irdx07TDfKbT7UUuU6xpU152uM=;
  b=AH+YLm2XZIgZ6w9OfEWqt7EojHaN7NsrjwiqjxleQfx5H0zSUPGX6uor
   1sOGiJwCUrWT5vb5nZ1js1KqfNK69SUHCd4sGEKnbrKDQGitxyUW/Hqcv
   MgaVoZ5C2Q3iXok28FkYZIeZQo5GpLhAucK0effVUISu/vcxRdRS3ow0p
   pAd/VOJ1hKlrKxNHnnKqfTqF9Q2w9pxSuiTrv/5tA347OLBRSbSr+RH5+
   PayGwoRVd795i0K5K5FlpmcQlZ4acq1QNiLV/8Id3qyjgrMlyw13f3KxW
   bu96H8nJqi/Qb+0t3/DSDW56W3M1tXtGsW+VmrfA08bZyFVtoksPTZzC2
   Q==;
X-CSE-ConnectionGUID: 1DinwsULSZOuiloQXjMLWQ==
X-CSE-MsgGUID: pd20ZpSkQtWsyAWmu5MqXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19683151"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="19683151"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 10:25:35 -0700
X-CSE-ConnectionGUID: 3J9wZmK4QA2s7zwfIlc03g==
X-CSE-MsgGUID: hsf/PIyxRheXjJnbfZrpPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="47266530"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Jun 2024 10:25:36 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 10:25:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 10:25:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 10:25:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/bC0WJ7HKQtgfoKkFaB+cDW1WuOo0UjolwhEsmmZ9tOO2dvKrkbVpKJJTdVfvVX/K5dglHZz45UpEEU6klTCJUYHwEfb6CsCDef3P1loKwq6Kv16pmy0XQP9cIDTPkTRzCYxoD9KFPcI/diZ4VJx6aIZFbgluTvsODXK8XcQNXMXEkttJaB/g0yJCx+A39zYhwZeIkGCpGHK1+pOzeJTw85QFAk1Egh9jtqdu41V7VcRfMGkqVycuGJoB2EHEJX8S/vLJdSzS78i9gctHtK92LAtatebeG3lcKYqn6H7Kb2yTsEhihsJLPl23tRa9N+q6X1vz4X0CF1o2F1leldTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3woDyVUgYKwPLNq1Irdx07TDfKbT7UUuU6xpU152uM=;
 b=K0kcrqBv2w9FwzqbLiyyz9rlq7I9nHJ0kM+5Xns8xCB5+NegwaBB7aKH+prm/HN5saN0vavy7+J4LawyIsBcTrUnPW9FCrMQazsXLQx6dt5IfuodZewdFiArMjp8EsLYfuJgVsGIQT2vKceH/SN2v33A3iSGUth/wtS2wiG4wSupAvY7ByxNZAvZz/UhtHL5UcqrQzRUtkhSn0wjGWk+oZF9e7UXK/LsGLvDnlutKbQ29RtXiXPRSLQxz2Pofq3EFz2q/mL7oEiHYuEtgy5372hW6dPzj8xuxbK7HKZQ4kkPcYoUBTkB7arWzdcVK2axgg8tUPruZfKxsXeNx/OH5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 17:25:33 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%6]) with mapi id 15.20.7633.021; Thu, 20 Jun 2024
 17:25:32 +0000
Date: Thu, 20 Jun 2024 10:25:30 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: <linux-coco@lists.linux.dev>
Subject: KernelSIG / Devsec call cancelled June 20th and July 5th
Message-ID: <6674660a557e4_1daf29482@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR04CA0186.namprd04.prod.outlook.com
 (2603:10b6:303:86::11) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM4PR11MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: a36d0152-f5dc-4bc3-bb9a-08dc914dfd39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ijAk1A/H1jZmn+CjEFKqS3YE/ThAEATIM7WIwDYGmdH9nt76fAjyAH0lMx1L?=
 =?us-ascii?Q?gISrJON3rF5inK+yK3HLYnQiJTHTRXydlqIy+XSrRHvP8KGV6Ukoy6hkj498?=
 =?us-ascii?Q?Vzc2RQ6LfuOMBBA0rS5PTowxRIwsy4RtLX1/CX+idOXxokIfopsBV/UwyfXE?=
 =?us-ascii?Q?1OErG9d2u2+PRA9tWF37NBEy1vQnvuqclIPoPeTZGSzYI8Qff50iLWSWlKHo?=
 =?us-ascii?Q?15e81uIcsjBW3f+sO158ut6nbK2bHZtFmpxijmhmAT4PPRbdFW6n/HEK7i34?=
 =?us-ascii?Q?mWPp9w/3lextyWylGOdl1h4VJQx1vrMjQ/FNNydweouqcJHeJ1hFt8jY1xXl?=
 =?us-ascii?Q?MLPOQOB+hi6QlUy2Aa+7aX3mH8QA1GhSFkeqvFPJwel74zhNN3D6SKEk9mUI?=
 =?us-ascii?Q?kl1aroi9gmN24MnKvOtFgjQa4M93xmI46IpefI9UVRys03ktMvXDnWU9N9Xn?=
 =?us-ascii?Q?ud59Vn7ThUkajB+vwJljyxSOY/Xdwh5rFHLrXOu8YmMp+sjR6DJl5qow1UFj?=
 =?us-ascii?Q?ipH7JPTsjtUa/t49zPPYVSMsF/oxlgW4vAWN1GcTL/bzb+NQcQQ1Fzs0HXke?=
 =?us-ascii?Q?1AShsWbO/BiKRb8WqC+7Nl9Tu3BC21IRN2F0sCpJ4/ysaDM2+70Qc18UkB7m?=
 =?us-ascii?Q?qouQHaR/wDv2CIZeSzjd+hLBK9Tv7O4PT6iLSiNoGznTCgBnILIDdp5BEtlp?=
 =?us-ascii?Q?ziNWkfcUoNn0ZwZTcUipkjfnCLqfcl0TIoyDngyIpNc1u1PefPGKb662uLRU?=
 =?us-ascii?Q?J/q/7A2g4PVuYI/gauRnP2oN/RceU5cLnyyWV6myk7mdRq9j8AJK5+s9q0G6?=
 =?us-ascii?Q?Nj1Z6Tf4sDvLDf6mIbBZ60LQgAGYrGfgGnzwa+x+dIORsuheKORYOvj89KZJ?=
 =?us-ascii?Q?Wknf1LVR/B053l6f7rFtZP2CWpUrM7hbWAUokQqwYbyBVZoNfkOamskQdQZc?=
 =?us-ascii?Q?GPbRZxPBmfBv/NPhfAROYfyb2yFzEx5fgenEH92N/O6KyxIaFL+oQtYPI/xr?=
 =?us-ascii?Q?BCkttgHCxjYCFnRiMWun9qc7w1k/TvXihHurQgITifAHY31OK2tKsxPVQAza?=
 =?us-ascii?Q?RhjJXMDiY7ZAOAg7gZXDDyYS/Jqrp2wmmX7qkXCyxMhxhlXgWLGkULS4SF+7?=
 =?us-ascii?Q?1Zy8WTGIpZ+HU/ZpTq/twyWNCD+G8yMAUuonJanxwdYOOReksGue0jlfaoeu?=
 =?us-ascii?Q?3MBeFfPXSzm3Oju4BkFpE3UBf7OeVAsUDjSWML3dCWPWzRiqVwaUKFpwBHjP?=
 =?us-ascii?Q?9o0ccsTm1JG5uQ9aRg+qhwRNMX1lZADMaIwNc1HwhE5uaBMi0RCeYBbTXQf4?=
 =?us-ascii?Q?sG/jvezFjX1xphLoU+OMGQ9Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mWcKHcoIzVNcMPwjqE12JaBHVKFEG8nmURLv+IwfBd1/GjwRfogNZiZJpDjD?=
 =?us-ascii?Q?xGD6oiiRM5UmZYuzUUGnJB2ETA/OuYitZCdDfOwuhDDLA/PKHzIdyt7boXGK?=
 =?us-ascii?Q?KW2wrXtTot0qWknbL9YY8oM9T0O2Vie06ZqybPcVWJJMfTpczzKGsD80e+Cb?=
 =?us-ascii?Q?F5HzkvOVpwY7n29cXDrwDDiMMy2TCme79IgFUbjj06H98eVSmC+LWHKYhUKU?=
 =?us-ascii?Q?d7P1Ch6mMAnVoXtnw+izaZyPGX1TjpOrkYOQGmHFOXdjrPtA+eLOuWlPVUox?=
 =?us-ascii?Q?vfhGhT0WqA2N3o4QnM8AHbMLbZavrkB0sAUjYFjqqec9xuZwCbAe53PztHEt?=
 =?us-ascii?Q?iTnHv9LEhMH7x4pmOup4LbT/PbHapei74U3rL8kIsW+kg5AnkUMXK9lA160M?=
 =?us-ascii?Q?UHK9pqPJFdvvm7ycHWYf1rLSr1YexE5fGz0g0KKwv9ftDUPmy/1PB7LHlh8F?=
 =?us-ascii?Q?6vluIMlLXdgifLgdVkQzUzI/SCZ5eGw1cMiHiUWLMpAZa2Y73XTOSGFsj6+g?=
 =?us-ascii?Q?9IVHBpYOD6pz9IKpWVttLStbSbB3URIdvZKtP/24kcDs6eUmId7NEZ30MkEs?=
 =?us-ascii?Q?ABUb2DeXCNtHppy+V5f+A3Y05S7BmNBiaBov1XvqX9KPjk6FGIoOmobBd1me?=
 =?us-ascii?Q?MFAXLOPJzLq4LwkWHmlBSgwhSK1ZiHUhfizWJn3LEaoI0qrHAL9ZO0hetbRm?=
 =?us-ascii?Q?pyzRImA0NO96W5ljdAQSgpREp1Me4CRCxVvTGR+CqXhPtBCxfNljgn2SDi/V?=
 =?us-ascii?Q?pYT0e40n3xPT1xVeePBCUaIHoxaQx8rghVvrUl1d5VTo+9GmnfJWjkA8xITg?=
 =?us-ascii?Q?C8EzXr8ZWJh4M+SxjPCyFiJOZjHjQORf0pjkKpjfRM0vcgAjg+kGQfgOddf/?=
 =?us-ascii?Q?w1IdkJtkBpwl76KFM0AojuEoBOON+HMp9qoazb4j+6WRts0FrkGvcdO/hID2?=
 =?us-ascii?Q?q1Dts5UK1LMsRu605xxcyffcaN/zNQ7Ch3MAREF5btcX4tLO5Qcm+7wlg2pC?=
 =?us-ascii?Q?k1kyhKyHkxDIFNAs31CaEbyfHKsnkRnVQpMHuQirmQW+6YZ1NBatJ3K8plec?=
 =?us-ascii?Q?T4XQes+X/f/iaCtMXAkODaHe8dxL2Y6rM9mENKuSYLE1s+yPym7dNyr8XsU4?=
 =?us-ascii?Q?10CjfNQQ3PRu9Ti2T8muTw9fy/P/SacWkmzMjr/4NcZk8h/P3ev3FKzcM/3w?=
 =?us-ascii?Q?tP9EXwBsxGyZ9job7D3gXGahiUQGTg7bPU5sgI6x0+FZNkJ02LR1cHSwNvy9?=
 =?us-ascii?Q?QvidKigB8UKIPM8ROijgGyme9+rzwwBrP9wUVdmSqKGqHpzaPcI4XPQCsDfZ?=
 =?us-ascii?Q?n7nboXuwQPBrdCJAr6fvLWtwTtE8Z/JLxN0TTqLKzH8n3SIMnqoOOphiv2cX?=
 =?us-ascii?Q?EJ3n38EFcfyn6SVpj/WstYIsdYBWhwFa0XFrI3gOFWQV9b3ylRuihimwGQAb?=
 =?us-ascii?Q?PeqNngEDA5YnmTQeeYlUnXZSl8qUks+eCstumjpi2h64pp4gpXe0apJkscUt?=
 =?us-ascii?Q?IgLyjsQBWcVboiMAu3uEpQPzpuW9Xjix1HnMWdgCGofEwK6Ikv8FIVYg9nMp?=
 =?us-ascii?Q?Vy8OCk1rwtfgTK+azevBCE40fxAROHyoGJ1RAkd7jaNGOO59C/qpCK6fDHVY?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a36d0152-f5dc-4bc3-bb9a-08dc914dfd39
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 17:25:32.7846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEt9tbZxr0p94ADglyXh17zO5Ich1IjD8cxBC5cCT1AMvlVARFdBspe1Rk4WvXuiPUok3kMXu7Ulg8TAdCSZc8c7FYM3hNHBqXIfhxI0X6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6550
X-OriginatorOrg: intel.com

Fyi, I have a conflict for the KernelSIG call today and July 5th is a US
holiday. We will pick back up with the regular schedule on July 18th.
