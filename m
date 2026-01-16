Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FCF21ABB9
	for <linux-coco@lists.linux.dev>; Fri, 16 Jan 2026 02:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768531218; cv=fail; b=uPhFtIOjfOAmWcQI0J3s9ZW55tSsosQO7YMrf9V92IOPIfUzgpf0mn/f8Dr60ljM+i9ICZyPgVO5vVXEgrZRibJ7KEWb+3IN5ix348vrwph3mlrQ04qlJLGGlVJqJ1+jkHQo1R6huwpIkhQraXmt7FHXQqk9DnilYmZ6TOFOJFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768531218; c=relaxed/simple;
	bh=Tk8zsy3VgFHc1lxoql/Lh+aV3nzvlocFeR6Eg5fV+Gs=;
	h=From:Date:To:Message-ID:Subject:Content-Type:MIME-Version; b=Wb3DZZCY3A9SKvjb7IY+KaNW3NR/XBe5g9/SbSrhXWxAPcJN7GCUOmVufTgWH9Syf9HI3L8sqTXg33GttTxhFZ47jeZnGKSVQnFh13TbGrXy/usrMeJeaVbQXUkTAYPJsm680woSlXV2evUznaCUJZauQS0as04fqj9W06jsCn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uka+aLQB; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uka+aLQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768531216; x=1800067216;
  h=from:date:to:message-id:subject:
   content-transfer-encoding:mime-version;
  bh=Tk8zsy3VgFHc1lxoql/Lh+aV3nzvlocFeR6Eg5fV+Gs=;
  b=Uka+aLQBUKzjTCzafra8NbxSl56awYQkRBXjTKySWC6s5HsUhsj/6Pq9
   PIJmquhUWd3W+/sSh0HGIt/f7SSvukGSocBplBib3mGGohYTp5c0/vBCf
   1RClWQRpCQQ7PyQqVoK0TbrXXmxTgMqj4EyQmiDEb8q7rjqulv5zWfRW5
   6WlsRCHjMlId7ZwJSwA4lSUmV5JhwR/VQEbHwbEh4DhW6dcJpiNlBjbGs
   Mhli9AqTvY0uLgvQMIvnli9jZ3j2gnwRN6zvo4EDjEbnrWTXRQz4Uh8Yw
   K2Uq/Nuc1xZ0oOtZA6U2AZphWjwl+Pl3G6816JVLvFJlYALDv7w8JpJJV
   g==;
X-CSE-ConnectionGUID: nxxE4jgBSFa7KOxJF1O6qA==
X-CSE-MsgGUID: lfLuGQkOT5qwlc7luLVKhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69759599"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="69759599"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 18:40:16 -0800
X-CSE-ConnectionGUID: 2k0XQqIdQj2k5QyycCOZMg==
X-CSE-MsgGUID: JKsh3/+GRKimhnAbLABs3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="209620414"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 18:40:16 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 18:40:15 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 18:40:15 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 18:40:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RC5HIXi2JtxWcz5eCPTEoLkv2Kcl80k1hePGwnEKrmA9gJIKlJtnlnsgkHcrJZ0+6M3Q8AemwpiZwPGk/BIdj4hjaqFwZqQsdWIrkpvanCSsYNlhTqsC4D1+A+1oltQC5ZV5hxutGhpE1+ezUdWYvu/H4G+w8wplD8i2tJ4/ak5SPY2jKtVWN2VOxd9OmrjLNw3VUrqBsBeaMQtxhZjUWJ/tNzMAglYRWb+AkLR6aCpGKlO+JGQ4AJlKTpJsW+OZp/SIvxv4SPS5dz7r9zmWzqROTDCqI8FxcZv4CICEKJjSAhcRosi/w2BRnpE1yj1FISytOkIlENpJ+7oadg8ySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tk8zsy3VgFHc1lxoql/Lh+aV3nzvlocFeR6Eg5fV+Gs=;
 b=dZ6rxTV3uAB42cRYRrFofqCR5we2ZjH9kF9SJkf5/hlKxVO22cqEqVRvjgt3CSqPsZn1v4vJ84YrQArowrQxVHvg+FThK14gldvYxRv2vVXUM40llsZ3/kr5eqPCr7CowzBgjoZbx4xdGNDzPC9HOToeUbZVBVfqtIUMckMJgYSxPd0wWUj/110sk/qh8HhGMzNAqauIRZaV9dIa3/f6qZYJe55inOPyHyw3ETQXYaZGVkVbA8VTFkj0aMwrfIoVJPgYppqBo0/aiv5y+w3FsR2lh/8gg9WGGPhuFrZt4uZ7JjajiBIfWP/jUqiBlz7vItL46kpx+XUjrmQdCjOeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by LV3PR11MB8743.namprd11.prod.outlook.com (2603:10b6:408:20e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 02:40:12 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%2]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 02:40:12 +0000
From: <dan.j.williams@intel.com>
Date: Thu, 15 Jan 2026 18:40:10 -0800
To: <linux-coco@lists.linux.dev>
Message-ID: <6969a50aac9cc_34d2a100eb@dwillia2-mobl4.notmuch>
Subject: CCC TEE I/O Cancelled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0047.namprd17.prod.outlook.com
 (2603:10b6:a03:167::24) To SA3PR11MB8118.namprd11.prod.outlook.com
 (2603:10b6:806:2f1::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8118:EE_|LV3PR11MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a969332-fb46-4e04-dae1-08de54a89267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0dwbTBFemNrTjdWREJlN2hGcXo3NU5DSGt2cDZCS3hCejVQNWZkUG0ybzJj?=
 =?utf-8?B?Z2NKcWp0blFKcGtBU3VBU2pGeEJWTjU2akxoWjlLSUNNa0ZRbkkrUzRMeW1V?=
 =?utf-8?B?Ky9PQlVKeFJYWE10cVFvc0pzSkhSR0VUejJGVEFvbWpTQThKbXNrSnk0QWtY?=
 =?utf-8?B?c2Ewd2J6WjhnS3NJVWlYWVFsc2lucnV6OE9qd0FORCtOVFBueklXcWFpaS9i?=
 =?utf-8?B?NHRBcjhJSHAzOFJKNnVFVTR6akREYzZTRkJZNElMaFlyNTlScVhIdVU5b2RY?=
 =?utf-8?B?YXVGUmd2VE55QjRlT1U5NHVSWU9ycFZrMUdDMGdtaFRiODhmY0FHc1YrOC93?=
 =?utf-8?B?dnA2NlFVRktNTWJPZ29xTVRGM1RSeFBCNzdrMzZCZ2FkZmtrQ3R1cnZkRzhF?=
 =?utf-8?B?UEVrNE5zaHhKUThuZ3FicU5vQkhqaVBSVEtzakxPQS94dUUrWTBiNkIxcWc5?=
 =?utf-8?B?NlpRdWtFNkprQzAwRUIyQ1BUbEY5cjQ2RXBNZ2FtT3Vvb0ZnbHlZaFA3bmJj?=
 =?utf-8?B?L3paSjVBN0h5R3lnUi85c0U0V3MyMTFDOEZKTlEzNUNoaS8rb0xIdzBUSWZH?=
 =?utf-8?B?SXRKclI5TXVwM0RkTTlKcjZWSS9uK2tMcUZmVWtCK0dQMnBWVEFVeUNWTER4?=
 =?utf-8?B?ZlFTNkFjL2MzYmRUUXZMUGJnTnoyMjVNNW9BeVZEam1CWnc1OElBcjdkZXRR?=
 =?utf-8?B?RmlpT2cwK1lIV1Q5bHhBaGEyL0pmdVlKV2dEZTRzUkxYZmhlWXMzbE1Hb3Rl?=
 =?utf-8?B?RmtWMzMvUzRoZ3VIeUlXczRXWjJ3MjJMREkvY0lTK0oxeFdtWWtodEpHbm43?=
 =?utf-8?B?ajlNdFZVQ29ZLzVudUJnNFVBSjFzR2k3U2hRR0FJQStEalhPMllhNnRKSFc5?=
 =?utf-8?B?V2pkWm1OL0RpNDZOWkJkVWJtQUNuZXFoY3ZRZ25FSkR5WnRFSlRnbkd3Zzcz?=
 =?utf-8?B?bFQvSVpzV0pabEpHSTZFelh6a0RWVGk5VjdGVlBoellZWkd4S0l5dlF3YVpV?=
 =?utf-8?B?Y1JUYWY2czl2QnVIak8za2NsYXNlcnlrU08xOExnQkorQWtkd05SRmRLbEI5?=
 =?utf-8?B?ZWFsL3QwbWhKVFJlcnZITGdsdVNCV1QrTUhqNGZvb2l4MWlnRi9iY2RaL0ZV?=
 =?utf-8?B?aUJFQ1pFZGFKWkE4TmJmbHBkTVhvTWtJUHQ0WXJmZmpENlVzNUkydGJwSlJs?=
 =?utf-8?B?SnBnbnl1WHFyeFpWQ29mWXJCYWpxK1VUR2prUWVzcFZxcDhjK3hLNTE2U1Vw?=
 =?utf-8?B?ZHRIOFRFS2Qrd2dKamZSR3ViL05OcXB4QnJTdWQyVlA0Ym03ZEJxOUwyZFpq?=
 =?utf-8?B?cnI4TnpING5VRzlZY2hGVFdJeDI3WHJDZDdrRUZTSmswekp1b3pLTlo4V2di?=
 =?utf-8?B?TlRHUDl2QVRpLzhKSStaeHlxOTJ2Q3JJdjhPQTJJSGI4UkNFOTJVWGQrdng0?=
 =?utf-8?B?dVJqSGJGVkNUNSt0Q2JoenBKb1pPWnc4WmRzMlRSK1VKRHN1QnlUWE96K0hy?=
 =?utf-8?B?RUVHZ1UwY0d0RWxuMEZwT2kxZ0pqcGU4bXRUWWtEVFVFbW9yUVZxdTJuWTFL?=
 =?utf-8?B?R3dMdEpqYmhMcy8rNTBwTE5kSytwSS83cFBoRVVmRTV3YytiZXhQZUhBN1lw?=
 =?utf-8?B?c1hMSys0NERvY2laQk94b2U4T2VmaHZWOUllZURVUllST2wzSTRyd1Jwc1do?=
 =?utf-8?B?V25ZeHV3YnY4MlpPMVpLUU5FSis0U25OUU9LQWhoVUxRZDl2UkxtbXlhSk05?=
 =?utf-8?B?N0x5ekk3QndYVFJtTnFOcnFRMHNGTmoxSnl0eEZPYTRXczAyRGxocSsyWFFP?=
 =?utf-8?B?eGxFVjZLZklPSDFvdDZ4cW8rdVdjQzlsY3FEZUVQR2FkeElJUW1oM0FINTVN?=
 =?utf-8?B?bEJMdkYrY3NzWVkvRHlnTzV1N0o3RFQ5SHJhY01PN3h6OEM0MENQc2NTL0tV?=
 =?utf-8?B?Ykh5K092bGpjQXVNOS9QaEJCRGVGc2ZTVENsRDNXaXVUcVZmMkZxUlFWQUJM?=
 =?utf-8?B?ZlFwdTQ4NURyUXd3RCtyanlCTW1PbVpyRXByVHFmTlRhcS9QYno4U2xjSUNo?=
 =?utf-8?B?cXdqdzhMc1lpZkptRFhTYTdpOFJna1RGWkVOcStCMkxYSzdUL2c0S2kyaDNk?=
 =?utf-8?Q?/vo0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8118.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjIvdnFxd2Z6Sjl6NnUzaGFHTFF1djlwNE5BUnZVaVZJaytGd1VZRWlQbXZO?=
 =?utf-8?B?U1pTWWsxeUV4RldQWUFBZ20xNWJmU2ZWTTlGS1ZuWDEweHBhT0F2MCtKWHND?=
 =?utf-8?B?V3cvL051MHQzeXg4OEpnZDcralcrMzhpUXphc1AzeXZxdW83VWNXaFJaNWpI?=
 =?utf-8?B?WFp2cGxiL2QxaWF1TUJyUDRRTnpCWkpiS3l0aEpSRnVBczNmc2N0TlRlN0tP?=
 =?utf-8?B?c3kyL05DVHI1YUlMMFdSd0ZDWUJwQnlXbCsvTFg2ZWd2N2RQQVB6dXA1MlEx?=
 =?utf-8?B?Vk1ERzU0SndxL1BDcjFVbUY4VGlEWUNvTFRiT0ZHMXFCblBsWERORUltQWF1?=
 =?utf-8?B?ek84QjhBN0QvSmhPMU1sNU5jcTRQOGFYOWhCWERXKzc0eGJzMlNyQ1hkRjFS?=
 =?utf-8?B?QmRWSjVPeFc2YmVSVVZFVklraUE4bFo2SnhzTTd1VXM0RVU2UGxvMmxwbHRW?=
 =?utf-8?B?dko0OXo4VGFEaDY4T0YzRUJGNkZERlFQNGdOcmJNVng0dDRobkxyZEc4dUY1?=
 =?utf-8?B?a0dlaWZXSCtSN2lYeklpUVpPQnhQTTFyNUFqTkxEN29YdmtBS3lqMXhuRmFw?=
 =?utf-8?B?NmNZQm12eURvTlJGajRHanZMVmlZVlVaYi9rZm5hd2hQZCtsOXVaNFFtS1Jv?=
 =?utf-8?B?UGhQb014clRuR3B5cERDckNoYjRGYmpqRjlwN1o0RHNoSWpGZkoyeUFqQVBP?=
 =?utf-8?B?WkFkVXViQzVjVEY4bndRQTBJNWJhNkQvVzhKSUFtazFqMU5wUlJiVTdzdW15?=
 =?utf-8?B?MEpkazlsbksvZjBwdmp6THIyeGZQVXkxaWpoMHI2aWRqN1loV0RTQzdTREtw?=
 =?utf-8?B?U2ptb3lsc0FWM3QvUjJPRjVnbEdnOENjSWcrQ2Z0ZDQ1cXAvYjNZNm5EeWM1?=
 =?utf-8?B?TTlFa2pxQ240WVViVWpwYUJKdFVDNk5qR20vTE53ZEM3bFNndmlTOFhLK0ZW?=
 =?utf-8?B?R3R5Nno1SVNiSUZBYzFGUmVqaWZBOHdoRVhEdVNTUGg3N29rOWFLVlhzNldl?=
 =?utf-8?B?SzJoVXNzK0hxL0JiaVorSWFyUGNlOFFuZzNEeHB2aTh3UE5oNHRaVnVudzRx?=
 =?utf-8?B?MlY0eUJsNWpPanN0ZGp5Y3JaK25BNStidGl2U3FVT2s3UldNVDlaR3V4L1Zm?=
 =?utf-8?B?eXhpdHRVMm9lVmNMOHRJMlZTRFdDNlA3R1pLT3c3cFJHdStjaWUwU21EanU4?=
 =?utf-8?B?cUt6d000cWs0ZDZGbXhZRWJObWlzVXRKV3RlZCszK1dYeFFTS1NsOU1CaGJ5?=
 =?utf-8?B?UC82OS9NM2lJKzRWQTViMkt4RU5sOFZ6SGpKdmhNZ1MzbGRPT21Cc3I3VmNZ?=
 =?utf-8?B?alZ4OUhSTHJpZ0I3VFI4ZTliRVh5NnI2SnlCdTlXVGpOd1dyM3lnVjNsWVlV?=
 =?utf-8?B?Y1hUNW9hSmZrR0c3dGwzb0ZnQzFhWk0wUUFnb0JrWllhSkROR1ZFU1VZZEE0?=
 =?utf-8?B?Y0cyZ3E3aG9lbk1OMk5BZWswRW9rRkhPYW8zaWJ3d3VBOWc3cUNEdm5ES2Qr?=
 =?utf-8?B?SHVDWHRDY1dpeExkNWllQTB1MTFxMXZHOWpWaCtYdyt4aXNjZUpVRXZ2TlR0?=
 =?utf-8?B?eVg4M3g0Z2FqRGFZdElLclBON0dMeDZXSS9iNi9QVzF5MzF2by9PaGZZL3FC?=
 =?utf-8?B?RmtKZUNuRVNMcW1xd0JMWTI5T1phNGRQYzUwQW9ld3o5OUpFZ010M3kyUVQy?=
 =?utf-8?B?d3hacEF4citQelB1cGJtOG04dERZa0VXZnBEaHFkd2M0aHQwQlgwN3pUbFgr?=
 =?utf-8?B?cXE1d01sL1kvU3lJVnlRd0NZamp1YThKRkVaemZPMndHbXY3K3lSaDJLS04r?=
 =?utf-8?B?bkJnWFRJZ2pZWEJZRXdSUGUvQS9vekYwckk3ZDZlY1ZCZ1FRb2U1a3EwYzRz?=
 =?utf-8?B?TFFoekwyZmR0VWtQUGRRSFVGb0k4Y0ltSE9NbEtjQTRNOUdobDIvMnlOdkNy?=
 =?utf-8?B?dWRkWVFsdkpYeEhIWXJmbG14cUhPMndMYjJBUktwUGFlcytUbDdrWGVaZk10?=
 =?utf-8?B?b2pIM1QzNnRnSkVqUG1lc21ZN2M4SVZQWGV1amtmaUZvSUFueUJ4a0Nvang0?=
 =?utf-8?B?OVpqL0ZkYWhpV0krdUt6RFdEZkRvK3N0eVJpQlZ6UWo5cjYwOEp2aDZ6S20w?=
 =?utf-8?B?K2pROUpyaTZSTEN4WG1yM3NVT2NES21zaTN3bk9qY2ZOTXVFMm9TdzcyZHRu?=
 =?utf-8?B?OWtjbzkvS1RONU9CS3RnVUZRK2ZiWjJZak95RkUwdng2U0dqZXQ1L29FVWYz?=
 =?utf-8?B?bklwMXVoNXZyWHdYRzZjbU5XYllEKzN0eFZ2R3FWbnpsQ2ZJaVYweHNlY3Jq?=
 =?utf-8?B?UzVYdUtld2JzTEJlMllnVWZsbERHeUZrZGoxOTQwTEhlTTA3czd1RGZ0dllW?=
 =?utf-8?Q?dJWgWm5GVf6gwmhg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a969332-fb46-4e04-dae1-08de54a89267
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 02:40:12.1839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGAMlV4VJEot4JfoyG1ZeRvuIgRR7HpBE8/bYJQiABh1c33d51M64dRfeMclvWh3wF/fh1MjSOJulz5fr7IKyqM9clHUYLotOYg3y3GLlQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8743
X-OriginatorOrg: intel.com

Note that the TEE I/O call in the CCC tonight is cancelled. We will
start that series back up for 2026 next week.

Apologies for the thrash.
