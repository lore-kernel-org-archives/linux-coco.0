Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3765128395
	for <linux-coco@lists.linux.dev>; Wed, 11 Feb 2026 02:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770776127; cv=fail; b=M8gEVwllv055yQNItLy6sbBRHvfOA6AxMyxoZy9k8BFlOtjSH5Rpdx1hQTD6DWMvdEiDmxYOygRdp7zQHwFy/7Q4dEtjv+1DrsbNsjnjNK1RxR47MNmJkMVIjG3Qp38Yhj8V3OKt81goZMOLLlX112ttvVxyuz0IRk9vfQNT6kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770776127; c=relaxed/simple;
	bh=qVKbq23c6jQCdRnD9lOicwjXt9NtQ1k9POZpc5FirXs=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=CQ/bQbY6zXkRDuvl92bS0W1GcMSCqmEHPLGDWB9/ZAw0oXB9oLE6qumPHNpo8U42cf+G65JYpKfj9gR9xp08OC6onPoZ1lLw05EskJMJPbITrNXeqnyB4pRf8qG+F6N4D3ext+O0pZDcfcZjvFeHfCFJq5TPQCOBfGldVL1PnWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G8p34c+B; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8p34c+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770776126; x=1802312126;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=qVKbq23c6jQCdRnD9lOicwjXt9NtQ1k9POZpc5FirXs=;
  b=G8p34c+BaAD3L2Mw5v5iL9FnwgrmGizkQc/Tb38auY7rDZEutOW94MZT
   6qHDq7SM/wWx6Db6KgbUexu114pnqyMYd7iN+Q/Sw3F6Kb/muCL2Kc5s5
   nnqGR1HNpCUKTDjWkzPV3cics6uabXtCih/VRGK7QDYtbRvAFs5ZP/ByA
   OXqvHuoDQDUOAvBvtE/kBSiwJHm2IaCWoZUG9ABWJYUsvLCCYJAV/PJWZ
   u8A/AyJVy2LUpCI0wqrNdHw9tKEUe4Gjq1eahvosPasqZd3D+Lb/pFkv5
   ISVhwlrzUEjYyHISDKSppbef8dTjOgO2rZ0cSmgnpCrjuperLrKjKxNC0
   A==;
X-CSE-ConnectionGUID: USaxtu5lRjKvEXyF1uJrpg==
X-CSE-MsgGUID: jTBervrOTjq0rjoEu5yo+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75545892"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75545892"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 18:15:25 -0800
X-CSE-ConnectionGUID: VcOYm0ZjQK+RxVkkOxKZmA==
X-CSE-MsgGUID: dvEjRPZyTK6FOOK5bFof2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="242706088"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 18:15:26 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 18:15:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 18:15:25 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 18:15:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dy2cA3cNfS3IBtEoKsBr+CsiDjwdfZErQxxwUF+KtWwyuJsu/6S+6hrCulQn3nYzKeuHkwsRyxbbxhax69hGCaKm10ByKDN3xZErlKQPPylDWexkI1ZhpV0R6I7GIZdQhHX5BB3eaIOa+dI8Zhpytg5mmLLkLDZLfrGjfMBBLZf0dlMtyuwEageLNRZvoQz5N2H89mcdTDl9CiXyGN33GD3bLo0wPxq20r6EH8nmuO6ELotqEYpo3AhIANGLp3VyVtYxrSepRP4VO0ivV94qOBrOMMgZh9Dvh9mA28PHMaV4uOMUsUCrXZdsA0bkQikaSQkflv/nlPHx++nJGNuhgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Esyd2XJ3uba7jejzskfu4hfoc4PuKPVOc7xxKBcjzhY=;
 b=HXh3DUMX7hBbGus2ZnUlX2gqVgk7YLyvAbx6min4F/ReSkjegbkaoD0I0p94kSkuZ+3MHwwPKVlM1pyxeq+ZDXUhMU6A2mwcVxxRhUSMxpIXSSuvyMXt2RTf+k3Um2J7VzcnMReGd6lmbMz1coi4kuDqvts1ZCDE3nYNi4458gDydBH0eEjILQZmOHoWH66IlMGtncYBTIzOKY2kmYjZ1UsFbSHnVysYCbwNOzEqmDGWPemzFAyimGHZuVe1DA8y2fOTOamERzZdcsXfThcwnIetvwtjj7vDFBQAAx+D3IvKJjGylFIQRERku4XJp2LvimhjjwgUF0FfTEQ0Mpi3cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CY8PR11MB6817.namprd11.prod.outlook.com (2603:10b6:930:63::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 02:15:12 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%5]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 02:15:12 +0000
From: <dan.j.williams@intel.com>
Date: Tue, 10 Feb 2026 18:15:11 -0800
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>, "Kirill A . Shutemov"
	<kas@kernel.org>
CC: Dave Hansen <dave.hansen@linux.intel.com>, Rick Edgecombe
	<rick.p.edgecombe@intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>
Message-ID: <698be62f7802_8c32100e2@dwillia2-mobl4.notmuch>
In-Reply-To: <20260211001712.1531955-2-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260211001712.1531955-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260211001712.1531955-2-sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1 1/3] virt: tsm: Document size limits for outblob
 attributes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::22) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CY8PR11MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 2656d051-f723-498b-76ee-08de6913634f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azFqSVAwUnFPUEJXSEJyUXVtRzh0THcvMmhiVzc3OWt4Y3VLOXJWeFVkWVdO?=
 =?utf-8?B?aXFKK1ZTUE80b01FZzA1YjZUamRMRDJQNE5QUHd6ci9ad05jdFBzbldHWFVu?=
 =?utf-8?B?QlY1eFRLV0JiamtoNUw3ZTBTSTEyL1oxZkFwQy8zVnVWNjR2Y0tQa0xOcC8w?=
 =?utf-8?B?M0cxMkdmNzZiZUJzZ2c1TXpFY3ZaRW52emthQXNNS0xsa3BXS21zKzZsUDZ1?=
 =?utf-8?B?Z1J1Mlo5NUxUSHFUMms3K2h2dmxnZTdTdG1JdUxQckRldDdWREdPM2ltR2lz?=
 =?utf-8?B?OERTNG9hdTF1UDVVM1QydmFUMUVwWFh5Uithci9GZDdmT01hSnFzWHNSWXV1?=
 =?utf-8?B?UlZoRDFlZU4vcC9jSlc1SGpmTUVuaEEwWnF2amRZOGVFNHVFb1RLaXc1Q05S?=
 =?utf-8?B?SGpxRC9EODJTcWtOOFBOT1F3UnV1NXNKZmFjOHJ2WVIrTE0vM2QzZWxadi9R?=
 =?utf-8?B?TzNDTWQveG9Qa0RmK3NxeXZ6d3FZcE1SQ2sxQUpxZkhJVXIxL0VKRnJyay93?=
 =?utf-8?B?d2U5MTZJK2tHTkJWNVg1RUIrUEhFU3lzb3ZnTWJmbnQwdDQrQVlXSG5acXFJ?=
 =?utf-8?B?amRQc0tiQ2o5ZmIyOFZsN2dtSGpKQVA1MHJRUGwyWXlKSDRKZGgxdmE5cEZ5?=
 =?utf-8?B?MlpqQlVrSVdQWjZFclkzejJqSFdxVVVRSUhuTFdPMnBSQ0NkT0J4NjZkNFd1?=
 =?utf-8?B?c1hwVngyTlJqVWtGU0Y3N1g3UHZqZnhjeEJ3dFo3SjU0aVZrQVNtcm9rTU0v?=
 =?utf-8?B?QStMNG5TVjMyMXo0WllEYmpqT2gyWjFHUVpoM2RTbTBacDExT3kvbTAxWTZj?=
 =?utf-8?B?bHZkZVk5VEllWlBnajVjLzVLc2lzZ3JNYmhmNzFIM2QvK1UzOFNJdVJYQnVo?=
 =?utf-8?B?K1RHRWRnUTU5MUp1VFoyRkk2MHp5QnVUSlFDUU5rU1hxdjBsZFUxQzZac1B6?=
 =?utf-8?B?SHFXOFFucW05RmpvajNYWWoxdEM3bk56VGczMVh2NUZvNUFGaVRob1d0QWRD?=
 =?utf-8?B?aUI4Rm92R1pOU1FIZXh3SGhad0VFa01DYnhmdkgxRENPNktMN0RUVTkwMFl1?=
 =?utf-8?B?cnVDZjM5ZW5odlZPQlVqUXRYNzdjU1NZcWhqV1lsSUpwVjNXaSsyTlFaNzFB?=
 =?utf-8?B?Sjh3Z2pBaVl5OTdSTlpybWdGbU1iUWpxcFMwNExtVFV2U2UweGRrbHVHZGNp?=
 =?utf-8?B?N28zYlNQQ2pjTytET2Nhc0ljZDhTakZualdZVUU5VWNDUktuMjY5VFBOTnVa?=
 =?utf-8?B?a0lIZjhRWHpRU1dqS2tmK1B0SENoQThSQkV6OTRPNjFzeWNJcjBJcjBkVXhD?=
 =?utf-8?B?Nmg3Vit3OS9aWnR0NWVOL1h3Nk5iamdsbDcrdlhtT1RxSjhuUWV2bXVsZGE2?=
 =?utf-8?B?RlVPeGp1WjV4V2ozaEhTNC9uVmN4M0J1NnFHZi9UNFFDZjRBb2UvVEtxRVFX?=
 =?utf-8?B?aFFXeUFPS05kclU2LzBGMVFnYjlKTUZhYWhoVFNWVFAzeVNHRVBPNE5Nazkx?=
 =?utf-8?B?NFRiaWx1b29IRjlQcUthTk1tL0NEVS9ISEY0UTFzZzlKRlB5THVxSjBTSUkz?=
 =?utf-8?B?cFpYQTR4eUZRaXM5cjZxV3RGV0ZCYVFGTkNMRDR2MkpUSHMvdnlDYThReEFV?=
 =?utf-8?B?am02bFovcjRWR2dZRDJjbXczQm1tZy9CdWprbXlSZU5iYWZzeWlWQllXQkx3?=
 =?utf-8?B?ZmNBZG1qWTJ4eHhPVHYxWDd4eUc5Q2IrNFdaNFgrYTFKaEFJSmJBQVFmVHl6?=
 =?utf-8?B?TTFIQmcrM0ZGZ0NFTmlsUmRqWFFLdVd1K1l3NTlxNG92YVhuemZ1Ti9Rb2Vt?=
 =?utf-8?B?OXpKb0hZTVZXZTlDdWJJSTNjMlFwY0EzS3pQOWltc2h0enFoK3dBOGxmeGlm?=
 =?utf-8?B?UVhpRkZtemJXS0ZPQXppckcyeWZ0cmYwY3pzVzlMVmI1TGY3QTVCbXlDNytX?=
 =?utf-8?Q?tcRzTRWK4dc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmh3bzJVNGNvZGVha3dRUklkMjZKOVJyQVJUNEZ1a2s2STM2YzZCRjFhY3Ar?=
 =?utf-8?B?MlRSbDlSMGYvL1BDK0NGUVBBL0t5M2NXdFg0bHV2WEdkYTR6NmljN2gyK3Ar?=
 =?utf-8?B?S1cwZU8wcnVSbVZURlhDUEJEa0RXTm5rV082VVhOdzNHRklTVXp6bStxS1lQ?=
 =?utf-8?B?d0tSYUhKVFErRU1rUjV2VFM1SlVKQTdQc0ZWRGtpZWtwWDUxMUtTMlVCWis5?=
 =?utf-8?B?VXM2cDE3NFdCbzJSbmo4dVFDdjJ4dnlDMkhGQURKcUI4VVNiWmFxNjBGNjJM?=
 =?utf-8?B?S0JrMytobGUxdTlDcFgxQThnVis3YWNaMStJWG9hMmsyQ1FYV2o2aC95c1NK?=
 =?utf-8?B?cENqRnpiUUgyMWxXSjVpYnI4cTJxTjU4R1U4REN0QWh4c01lYzhGRmtZYkFS?=
 =?utf-8?B?eXJoMDdGVEo1UDlWMzRtNzhxdFFJS0hDQlN5L0pHb284aTNRNVdCUndOemx1?=
 =?utf-8?B?N1Mwb1Y4a0ttckZnOGhwTWtQZ1NCcmUrbmdjeGY4NERCdXNGalQ1ZkY1QU11?=
 =?utf-8?B?OHoyR1I1VEVIWmdSTVFXWjBubElOS1pHL2poc2UrSHJZUFFzNlMxYTR6Qm9E?=
 =?utf-8?B?b2FaYmpzQ1lCNHpneFBTMjZ2QnN2Njh3RndNcXVGVmcvRUNLVVJ1clNoUW40?=
 =?utf-8?B?bVVKNnh5VGVybmo3U1QzNHlIS281K213ZGR0MkVJTEgzK2FhUGY2SVY0YTZC?=
 =?utf-8?B?WGhRK1doSlc2WWxmL3E2MXphQ0ZtSmh3RGlIM2EwU2h6VUlPQUUrajVBd1Bi?=
 =?utf-8?B?Z2xiZzVsVFdoeHQ2Sk80V2pHRWlBQ1BSMG5pSWV2SWwrQmZnVVBKK0J5VFpD?=
 =?utf-8?B?WFNMS0prNEFFZUprYjZYODNyWGZFdkVqajhSZnYwcWNlSnJlZVMxMTFGNVp5?=
 =?utf-8?B?T0FhRitSQWVLQytDajV6U0FadVlQZ2hsR05aMVVWRU5lWjhjVm5pd2JXT2or?=
 =?utf-8?B?SnU2UTJWNW1ZTm1idHk0M3ZZUjlvc2FPRnk4NkY4MzNIVko0aXdPT3ZVdWpC?=
 =?utf-8?B?TlJTSHZwdk82M1F4NzlxREZaaGM5Wm9zMVFDM2kzVWNoZGFQRFRwWUtRbU1C?=
 =?utf-8?B?YjlaQ0tPSkRDRmN6dGdLOWRxYWI2OWRPclRsUnZDNEhteVdzYkhlM2RnRW9C?=
 =?utf-8?B?QmQ4TFFaMDEwVTF1dXk3eDVpTS9IYUF6K1pmbmlJOHZuQW1USThqN1NsV1RL?=
 =?utf-8?B?akVSUzhHWVFPMEpESjR1azRrR0t1VHFMOEJNaVVZbnBxOU5NaXR1cFc1TTVv?=
 =?utf-8?B?K2ZNTk81VU1VY0ZUeHNrVjJsOHVDUG54aGJaOXdwczc5Y0JSczBjS3NwRzA2?=
 =?utf-8?B?UUFWOVc3M3IzTG5JZFVDNzFEbkdSZ3Uwb1l0Yjh1RlJaeWliamxTQ1hBdFNw?=
 =?utf-8?B?d2M3Vnl6WDFYYzdQZ01WZVlDSk1HM01XR2NpUU81SE8wbmVXYzVWSGdPT0c2?=
 =?utf-8?B?cENwK2FSQ1FxWjZjSUJQcWdEa250TTVlVjNhN3VDbnQydjRUd0RmWnB2WHRY?=
 =?utf-8?B?UmE3THZ4ZnFmN3I5ZXB1Sm1wOWdYV0krVkluSDhFVG02ZUdFdUtrb2dzVGNV?=
 =?utf-8?B?c25LRG9SbFF6dWFBVFBRQkdiQTUrN08vSnB4cEJFVjRVdFF0eGlpdVlna2tG?=
 =?utf-8?B?V3ZtemgvRTVJYi9MaU9hUTlMNGVYWGRISXJGM0Z4VFF0N09tRjI5cWdoSzh5?=
 =?utf-8?B?aUpheTh0NGhMWG55Myt1aVIzRzVPMVdiV1dRb29QUXpVMzJoTDVOS0VBNmkr?=
 =?utf-8?B?dnovT2p0NFZBT1BDcUZjb1dXOEtsN3U5dm43RDFUYnNNOWVzN0pvOVVVU2dr?=
 =?utf-8?B?WGVxZ2xBaEN5bldmeGhzdk1JU2kzeWZSNHR3OGNyU3BUd09lN3hvWFhZazg0?=
 =?utf-8?B?NVZvdVd0Nkt6aUNIVE9CKy9sZVJCL2Z6QmRMMEhuSlNicTNQNVIrbnhLMjQ3?=
 =?utf-8?B?aG93ckxocDRFd050T2w2NnFnbm55dXZEd2d5dm5RcVB2S2E4SU9yOWxrY3pK?=
 =?utf-8?B?WXZldWJJQ01yZXF5MnNudHRQRWdRVFZRUUF3T2hySTNJbTdxY0RxZUR0K09Q?=
 =?utf-8?B?N2FkV2ZqKzlJRGJaV3g4YWo0Q0RKOGNKR0ErVStpb3MybFJLcThFRDdvcGVr?=
 =?utf-8?B?RzVQaEgwOUgwcWg2Rkw4c1BMU1JDUmVqN3JYRnJQRGdkL0xZR20wNzgvUEVS?=
 =?utf-8?B?bDB6NUxRR05UYVcrSUhGVWpvcnkyUEpJRisyV0Fsb0pwaUxQU1pDaWY5YUtu?=
 =?utf-8?B?bFM2MDVQanUvdi8xOTdqd1dHSUE3bFBrK3VJQTAybXZ0QSs2cGdKMEozdERK?=
 =?utf-8?B?SUJTSDFjeitUSm00OWovdDd5aUlhYzBCbDIrR0o5VGZ5dk01TTBjM3lkWnM0?=
 =?utf-8?Q?q9037Vo4nEqLyr/Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2656d051-f723-498b-76ee-08de6913634f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 02:15:12.6848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbKWi5iMAfWXR4z5rwI3n80RdlU/qsDFKbFfSxu2nozNplPn1rGUaL0akxhLUl+iNYJsHcvKoorV9yZUIFmR/w1boa7xHHsEvKvyCqDrNSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6817
X-OriginatorOrg: intel.com

Kuppuswamy Sathyanarayanan wrote:
> The configfs-tsm-report interface can fail with -EFBIG when the
> attestation report generated by a TSM provider exceeds internal
> maximums (TSM_REPORT_OUTBLOB_MAX). However, this error condition and
> its handling are not currently documented in the ABI.
> 
> Userspace tools need to understand how to interpret various error
> conditions when reading attestation reports.
> 
> Document that reads fail with -EFBIG when reports exceed size limits,
> with guidance on how to resolve them.
> 
> Reviewed-by: Fang Peter <peter.fang@intel.com>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Looks good, I will change the subject to:

"configfs-tsm-report: Document size limits for outblob attributes"
