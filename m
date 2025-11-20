Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA687372ADD
	for <linux-coco@lists.linux.dev>; Thu, 20 Nov 2025 02:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763606875; cv=fail; b=ATKHzluuR3rbxkiqQ2Sza9yGmfHjD/MmdzuYbO+yVfktfRgFSlGiw4YcdZmMt7XCE7hIYntkxoCWxyb0J/W3VHRxbWT7oi1ZgjTCcWD9lMw79wvS1KzfCQfSXChQ1+6Yghu0+Al08UXHtbJ/VLjUrxRTbXkwvHc8ayoHm+GGEmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763606875; c=relaxed/simple;
	bh=x55dS7SmMCCw468sn3tQNVBisI6N10qbutQZ9/F7SJk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FKQNWsVwZP0bMDUbd1IreEPGjvOaVwvFkVWwCaQgwZz5qABZoiB8pb0vrduL/wg/X3Ik/Rtg0A0cl5mXBG8Fc4ZhRGx+/cmpI1GZ1IbSLt1U5+nHHFB5sTSGNyGV9x8BZ3bNTgGm5xjahvLCFaqSY2E9SVF70ScP1KmVBVwgMpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTiljzCN; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTiljzCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763606874; x=1795142874;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=x55dS7SmMCCw468sn3tQNVBisI6N10qbutQZ9/F7SJk=;
  b=bTiljzCNtObLpulenKYUx+B8lN78jcsy3VMhCAqqEbyfCyQlhgpzxmBB
   7mSytEiZS8NhkM5s8ekmyorVCRfhi3ECG2/I4vVkyTjC2eI208AaJ78ZW
   s535agY9jyNJm6emsveQ/UBGsddRSC8SSoPIrhpvFkxRjF9YZrPIPN3fF
   D/khVc37eb083id9iW9GGGINmLt2PODu2xQLbKURLumxCDNc53g18B314
   2Jh+5tqFl6u4HdRceKeb8RpueUt6+tnMLtN9FMdqfCkMR7M3HeA4z4udN
   rd6mlG0OLF1Nd0+rHMugFjCD+0QUJiKdc4VezTEYn8qSVFrnvVM5lrxTP
   Q==;
X-CSE-ConnectionGUID: Jkipr8A9QJCjdcALXIxHNw==
X-CSE-MsgGUID: tVWxD7P6SJGJAqJ8RJp20w==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="75992019"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="75992019"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 18:47:54 -0800
X-CSE-ConnectionGUID: mMu/P0r7Seq4ZSYaAH67Ew==
X-CSE-MsgGUID: EivdtCVvQuCWFCGZ8O0eQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="192030905"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 18:47:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 18:47:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 18:47:52 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 18:47:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYW8D7WDMeYgR1K14EDQIWi9RwWFfpcu6It/LkKiDaCpF+LniTD8ndDf2yFr7bCpVsVAqe1xUUXRV4+syYD9jVsOeMZyAcmyBGPbjkSX2Ck1RHGraD6+s6zLvcmPjYIJ8tPpdqLBNGfo6kODbZjCZERXI7neObFahL7bAs6cjNQiJvU6vvLLw3nfujQS4ob/jTyvMpVqVJBAq+KB77dLMt40P2BL6JB4KafI81+74vgCDIYM157US4kLJPKJpK/IqvDLCF9OmrRQpafGgyUL4YzKdu3Doz4YpO/Sby8Q+cl/Du3FO8R461bzV/7xMx0C3kAz1uRFP7Os36jBm8A9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5vQaYC9HBU1YNufz+Dy5sWdkFAbCKHZaOm/vkAMrqA=;
 b=ty7kgIAnh+WFC7ss/4089OeLCg/S+KZ1RG7CeCXwm0QCRnE06C/7JKtCa8wjIq4Kzgw/5BSIeLprPODFb/P2zRe4IaMjSf4pzjC5Yym4uNSF1P794jDirohIlTBwuxcQadQd7Rv4Z1gD0tZuQ2pLgqIc/j7Bmk+5qaUXuvhl8tR0dAQyr/hp4Sz93ZCUNN87h1qC9/oZ/2cRe+aGUwBAPRuSfy54L6UfiIxdsTdcZpQ58BlQbRvG9H9V4UfqTbBEVlwH2f5yxdmqzx5HRBHmBAGp7ndasOYU1N6Rs/KQuOTg5iQR9ARcz0/IwjYSgRmA1M7GmMK5iOEZ/u8CC8Gx6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by CY8PR11MB7340.namprd11.prod.outlook.com (2603:10b6:930:84::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 02:47:48 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 02:47:48 +0000
Date: Thu, 20 Nov 2025 10:47:33 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sagi Shahar <sagis@google.com>
CC: Vishal Annapurve <vannapurve@google.com>, Sean Christopherson
	<seanjc@google.com>, <dan.j.williams@intel.com>, Erdem Aktas
	<erdemaktas@google.com>, Dave Hansen <dave.hansen@intel.com>, Elena Reshetova
	<elena.reshetova@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "Reinette
 Chatre" <reinette.chatre@intel.com>, Ira Weiny <ira.weiny@intel.com>, "Kai
 Huang" <kai.huang@intel.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>, "paulmck@kernel.org" <paulmck@kernel.org>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
	<hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov"
	<kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Rick P Edgecombe
	<rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
Message-ID: <aR6BRVAB6ANVLduo@intel.com>
References: <68ffbfb53f8b5_10e210078@dwillia2-mobl4.notmuch>
 <CAGtprH-rv9T1ano+ti=3eU4FO2APCOcR06buPALggAwUnka3Dg@mail.gmail.com>
 <690026ac52509_10e2100cd@dwillia2-mobl4.notmuch>
 <CAAYXXYyVC0Sm+1PBw=xoYNDV7aa54c_6KTGjMdwVaBAJOd8Hpw@mail.gmail.com>
 <aQFmOZCdw64z14cJ@google.com>
 <6901792e39d13_10e9100ed@dwillia2-mobl4.notmuch>
 <aQIbM5m09G0FYTzE@google.com>
 <CAGtprH_oR44Vx9Z0cfxvq5-QbyLmy_+Gn3tWm3wzHPmC1nC0eg@mail.gmail.com>
 <aQQkrx2hXkPdcifr@intel.com>
 <CAAhR5DE=Y_uU1N6NczvZ9AJ0C7K_KNU-9Y4bBcQLkoXUDkp9kg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhR5DE=Y_uU1N6NczvZ9AJ0C7K_KNU-9Y4bBcQLkoXUDkp9kg@mail.gmail.com>
X-ClientProxiedBy: KL1P15301CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:6::22) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|CY8PR11MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8a91d2-746f-4341-86bb-08de27df30cd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXRjaGJTalhobzY2ZzVNOWRDaC9QQkxjRUFZZnBMdWUzemdxL09HWUVXYXlD?=
 =?utf-8?B?Z2ZnYldCdDhVRnNSbHpkUHZjMEg4YVgxeVpKbWJ3UG9yQUFHSzczZUFBOVQv?=
 =?utf-8?B?ZmM1SU1OYnFhSXNhMVY4ZUtLWXBCbEJsSGJPekE3TllsSFM5MGZGcHFDdnBR?=
 =?utf-8?B?SFIwY3gra0xjL3U4QU5oT2tPZ3RxU1JsYmgxS3hsTHpvS3RNRm9qL3Blckt2?=
 =?utf-8?B?MTR6T3ZVMEpkcHRmQmdhMDE2OFJ1OW5ETXJnNFRoaEMyOWJtajczSk9SOXho?=
 =?utf-8?B?SHRNb1NQcC9aaHFpWDd4TE93aUlIelZJb2k5VVgzbUZ4cjNLNnZrdGJHZUhq?=
 =?utf-8?B?bTNEN0Z2WjJlRjFEUldFaHB3b281eitmM1ZnYU9CVDBFTmEwbjhSRkFwYzla?=
 =?utf-8?B?cWUrM2JwWW81clhCcVhDdi9KMHVrZ3hSRGxRc2F4WTJtWWIzSmEwNWhVcjhT?=
 =?utf-8?B?Z3Aya3dUVkRRRWFXWnFaem9uQllNR1YxRnhBUFBBSml1T3FGMEZ6Q1Z5d1ZM?=
 =?utf-8?B?MTBUWTlTLzZtZnZDL3k5b0sxcEdKU1o4d3UveHVNRDdKTHgzekxVWUxtaXRR?=
 =?utf-8?B?TTdETG5VQjR5Y1NCdWZWWWlranlpWEFxUHlyQ2ZhVjBFZVdzYTN5SG9jemtK?=
 =?utf-8?B?andzckhPQUs5dmd5dmxVYmRKYkFyMHUyUjc1eXN3bmZMZ3k3cFQrTHM5MTA4?=
 =?utf-8?B?RmlHUko0SUc4U1lnVzFNc05oZHcwbmxXMkxhdEhXYWRVODc0NzZEN3lFMnFz?=
 =?utf-8?B?NmF1NEw4OFgvOGpxcDM1T3IwSWlqRXBVdStQaTlwd0Q0Q0pQcGdYakJBZWxn?=
 =?utf-8?B?WkR2VmlqTWNYcnZONS9Hek5ralZwdUFEaGtaMlFleUtnN2t5OHhTdHoyS2Rk?=
 =?utf-8?B?OW8yd2JnNlUrK29yeTRkUE4xazNBUE9lV0J1Zm5qZm81MkIxR1NPRnVGTTZu?=
 =?utf-8?B?ZzdTNzhJWTZlNUdTZFN3RUVrWm95L0Z3VnZBa1pKWlhYa1VUZWV1a0lPZ0Jh?=
 =?utf-8?B?TUJ3NXFlNHJocTdweElwbyt3YUpTV2Y2RTIwKy9rc1pYdGllbVR3bDAzYUxC?=
 =?utf-8?B?eVVma2o0akN4dC9NZzVLWmxHbW9seEdiRHBpdmptZEJXRmVaNjA5OFJlTzBu?=
 =?utf-8?B?UDJ4bk1HeXdJb3owSnhWM0VxaDJpQm94OGwrdWNaWm4yWkZ5M25OWTJ5L0lT?=
 =?utf-8?B?NUV0aUN6Sm0wVlBxbkZPWTY1S1pNUUQ3WmhneEN2ZnB4c1FLRE1ORS9PMXVT?=
 =?utf-8?B?eEVZdkFUV1k3RlQ5VTFGOC9uc1VuZ3NrUEdEMldkU0FoR2hLd0tDa1ZjaEY0?=
 =?utf-8?B?bkZxVWpWUGpWMVlMb1YvbkhNakdsQVp6alkyK2VERDViSmRiM1RFOVdSTDVS?=
 =?utf-8?B?ZWhaVUc2bUpNTjgyc2VRK3prS2JCVDlPcDN3QlM1dzdiK0JLSkJHRkRJa0pR?=
 =?utf-8?B?Mm1MUW01MHJrS0hNUTM0dDc3L0ZQd2dzWHltQkxmZWpOd012b21yRXpmNW9E?=
 =?utf-8?B?cUkzZllkVXlrbCt5QUJZSlVxVXcwbnczRUFaZXV0Qk5OdGc2VzVaaGlHNFg5?=
 =?utf-8?B?a01RZ0ZTc1IxTzNweXAxR2VrTjNLSHdLQ2NQZzgwUnE5Q3F6TGs3Nys3Z2tK?=
 =?utf-8?B?NSs5RytJZ0VmcnQ2S25NTjBxWndJTUZGTXhrQ3lUYzNOSlhNSit2UEw4ZnQz?=
 =?utf-8?B?OXNoRGI1MW4wRUxLUDJMZVRXWnVObEVIWlpuVkdWdnljUDVwRlA4ejg1Sk1J?=
 =?utf-8?B?bHk4VW9sWjVNZ2dwaDdZRkp4SzVUb1ZoWi9lOFR0N3gxR3JteCswRzg0UHp3?=
 =?utf-8?B?eVhVSVU2N08vaXNUOU5WbThwZDlBUFdqdlVZKytHYmUyMUlXOWE0d3VoNE5h?=
 =?utf-8?B?bnB6OVJRajFFd1NzK1dMRjU3WUpQT1Y5MEUrWnR3bXFqTjR2dmdLa2VFeTg4?=
 =?utf-8?B?YXFGeGQ2bFBWODFiWEVSeitJZFZLVEY4anhnbzNtR0JyTW1pR0JZa1M3Qko1?=
 =?utf-8?B?MnBOb0FnOGtRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3d6a21EL243M2llZE9xdG1MRXhwS3ZhWlpkZk84OGNVWEhrTzBkdFN0YzMy?=
 =?utf-8?B?U3B0aVZpSzU4UFhJYVAvMjNrVG9rdk80TU9IQXJyemt1NmxjcUo4clR4WWFD?=
 =?utf-8?B?Mm83byt0VDdTbStMKzRLL0FQYmEzU1AvTkhRVWd2ZDEwMVNNRS8zQmVTdFVm?=
 =?utf-8?B?V3pCUFRpSGgwalVnNEFyWkorM093N25LbzNKdlVKNjZiNnNCUjZvWDJYUEpQ?=
 =?utf-8?B?ZVdwWWJSVlhlVFE0RlMvT2VGQ2JUU1cycFdxTEVnaGl6U3hETmZyZTNrdzRK?=
 =?utf-8?B?M08xaXJCUmNpYjRXNFBVUkhWL3V4MzJLdjhsREhHYVl4V3RNMXVXZ1BMZnRr?=
 =?utf-8?B?cjlVdFpUbTJ0T3FVTnZZdDhpT1Uzam9BYUJIU3ZmWnFBRnlRMTFtQWpQZ1pt?=
 =?utf-8?B?clZOYitkdi8zOXNwQlM2RUhnaGlZSlJkeXBqMXo3M0ljR3ZicENSc1p0R2Jy?=
 =?utf-8?B?bXpwTE1zT0l3anZMTUZKM3pwSzNvN0ZpRVF5RU4xczFGOU5lb0Y5TTE4NnI1?=
 =?utf-8?B?UHhiSUpVblVCRkl3TUF3NjlCOVFBNk0zVEZSWkpiR2FkWVVXMzU0TUtpZkJ1?=
 =?utf-8?B?bUJZMUtVUGt5aE1tSGVFRkV0TEpvZHFkdDJyWW5EeUVaOGZoOWpCZTVmT1NO?=
 =?utf-8?B?NXhaWnFKcUNTaldLSWxyamwxRllrTElqSWRjWGxwU0hJWXh2K0h2SjZmUUN0?=
 =?utf-8?B?UVFmQVJFRk1Keis4YTZpQTZqdnFSc3FZQks4OGE3SHp3bUtkejRIbjQxRnEr?=
 =?utf-8?B?c0hqN01WVmFXSnVKc1FVMjU5OXpzd3NuaDVwcm84UzhSWGN2a1ZwYmlQU1JC?=
 =?utf-8?B?dmpkemprYjhZV2h1cndBUU5GU0gvZVdNamoyUDVGQTFqMUpackVPbWZ4OXFW?=
 =?utf-8?B?OGlqdVJKT3pGWC9mTDNHZzdFMmJrSG43bFhXU1ErbW1Ra2htRDR5WE5PR0FM?=
 =?utf-8?B?QzU4TWxjUW4rb3NoTFMyYlBkWnArbHpCc3JTV011YkdTQWdFeXB1VU1SWUc1?=
 =?utf-8?B?aE9wNDE1dEFsZlAycExJUThWU2hjZlQ2eU5xbGNOMEQwRXZ5ZEpoKzBRUDlN?=
 =?utf-8?B?Z09OWk1KTTh0eFQvUVhxemh3ZDB4OUl6OUZpN1FsNjk3dkYvcjRHMndpbHV1?=
 =?utf-8?B?NmUxME9WSmxQdDdNczRaOVQ0UE5ZdFZUWFNpZW16OTUzdmZBUlRqNTFGRkc3?=
 =?utf-8?B?dVp5VmlBL1NRVDdlb2M5citzMjN4MUl0d3FSbWpaRml4amkwNWhhU2lWMURU?=
 =?utf-8?B?c0lvd2xmWVlVOUZWb2FNWGh2L1BEamNkSk9wUmx4SVc3QmIzUmJEQ05aemwr?=
 =?utf-8?B?aUZGODNOVU5LQkNPMUN0K3ZmYS8za2FibldSZXg2TGdRSFhpL3ErWHpodjdy?=
 =?utf-8?B?Z3cvQXI4SnVkZWNMWGNteHJkemNxVTVSQ0pWL1plRnpxOWFQQW9laUdjNXJw?=
 =?utf-8?B?MXZFVGwvZTVOMGt1dWhlUG9nRUtJL01rREIrMWxSaTJyVitJdStRSXo2Z2FH?=
 =?utf-8?B?UU90OW9KYTBvcVFBcFRaV2EyVUo0VXM5a0c5S05KcGxvanp3cW1wdFExcFNE?=
 =?utf-8?B?Qm93dVJCTzRsY3JrMTBxK2luazdKaWlrRlRoZyttcDZsYTlzMGk2bnNZZEZ3?=
 =?utf-8?B?ckpGR1Z1bFU3K1RrZ2tNL05XWGt1clE2RUdOZEhCODVqV2FHVnppOHEvQVFN?=
 =?utf-8?B?ZUgwVTNHNG96ZTRFc2NQZkcwSXRZeS9sS3k3OTZwL2hXenZJTlhWdzlJekEx?=
 =?utf-8?B?MWFmWFJ1N0hLZVFPL05EbEc1U0lPQi9VN3ZnWU9sRDJqc1FOTkVlbVFXRTdR?=
 =?utf-8?B?NFlaMzd2dGR6Sm9uNEtQMVVNU0lzdkhYelc3eVVaeFRBRTNpcWh4cnN6cklT?=
 =?utf-8?B?WFQxUm9icFhZYVc0Vm5BdzNPUjBURmxUczVhZ1ZXSi8vVWFnL1JhMU5ld0kz?=
 =?utf-8?B?dFZVN1YyVzNJSVJBbzJNZ3JxYW5uZVFmQXJRYmcrUHprRHpkUE51aWhzSXhh?=
 =?utf-8?B?elVna3JyeVVSU1V6NGZqSVdqT2pQTzF5aUpoNmkzb09kRUdSaXpjK2NTSEFa?=
 =?utf-8?B?RE5qdy9YQXlLdFRHTW11cEtMcUJwc3NSbkhQeURVTlkzUmVoNE9DUVVmTHQ0?=
 =?utf-8?Q?uhw13hIP+7oBHRWxrqXDGrm4e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8a91d2-746f-4341-86bb-08de27df30cd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 02:47:48.6257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xnm9O2sj3BGOrV2Nnul5YFRnFLK3ARzAEbsjuJLp2IPTDWxKqX2Cg09amT1kUYa5EN4MkBrD9UKtNDVQKIS6gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7340
X-OriginatorOrg: intel.com

On Wed, Nov 19, 2025 at 04:44:50PM -0600, Sagi Shahar wrote:
>On Thu, Oct 30, 2025 at 9:53 PM Chao Gao <chao.gao@intel.com> wrote:
>>
>> >A reference patch we tested for "Avoid updates during update-sensitive
>> >times" and one caveat was that
>> >/sys/devices/virtual/tdx/tdx_tsm/version was not available post update
>> >failure until a subsequent successful update:
>>
>> I also tested this. It works well to prevent updates during TD build, so,
>>
>>   Tested-by: Chao Gao <chao.gao@intel.com>
>>
>> And I can integrate this change into my next version if you don't object.
>>
>> Regarding the caveat, could you check if the diff [*] I posted earlier this
>> week can fix it?
>>
>> [1]: https://lore.kernel.org/linux-coco/aQAwRrvYMcaMsu02@intel.com/
>
>[Now in plaintext]
>
>I tried testing it with the 1.5.24 TDX module and it sometimes fails,
>but the failure does not appear consistent.
>
>I added a local change to add the
>TDX_SYS_SHUTDOWN_AVOID_COMPAT_SENSITIVE flag when calling
>TDH_SYS_SHUTDOWN and TDH_SYS_SHUTDOWN fails as expected if a VM is
>under build:
>[ 1224.571177] virt/tdx: SEAMCALL (52) failed: 0x8000051200010000
>
>But then sometimes trying to finalize the VM fail with the following error:
>[ 1230.915145] kvm_intel: SEAMCALL TDH_MR_FINALIZE failed: 0x8000ff00ffff0000
>[ 1230.948264] kvm_intel: tdh_mng_vpflushdone() failed. HKID 3 is leaked.
>
>At this point the module seems to be in a broken state and trying to
>create more TDs will fail:
>[ 1543.745606] kvm_intel: SEAMCALL TDH_MNG_CREATE failed: 0x8000ff00ffff0000
>
>Trying to update the module will fail shutdown with -ENODEV

Can you apply this incremental change to see if the issue gets fixed?

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index e525bbd16610..f0bea1fecc52 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -317,8 +317,9 @@ static int do_seamldr_install_module(void *params)
					tdx_module_set_error();
					print_update_failure_message();
				}
+			} else {
+				ack_state();
			}
-			ack_state();
		} else {
			touch_nmi_watchdog();
			rcu_momentary_eqs();


The problem is if the failing CPU is the last one to ack the TDP_SHUTDOWN
state, the state will move to TDP_CPU_INSTALL state. Other CPUs may proceed to
install the new module before seeing tdp_data.failed. This disables TDX ISA, so
any subsequent SEAMCALLs get 0x8000ff00ffff0000.
