Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A858F5D
	for <linux-coco@lists.linux.dev>; Thu, 19 Oct 2023 04:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOr0L35R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697689811; x=1729225811;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=THNMQpZQC3c6mbEG8GxcDbZw1tuNbYRKWdhNI3OXzj8=;
  b=MOr0L35RJSsuAByr5gBukT9KVAX5Q/WtZT4u0ofJ9GZ7TYFVSGOrVfsQ
   HOx+wui3iWCVLoG/6KwhR8BYhMwhA4D/+iMcH9Hl9g/07LzciWN0o47py
   RCooUZlz4Wb+hBXJyuW2iGvY+K6nTEKEcTl7OiPN41JgtT26NoAKxSoq4
   DHErtYPpFyJfFyKAILOAmvjFixVIoOg+VtPH/VZZW1WkwbWbOMyJVNe+7
   RJ5RDMLeJu+tTjqdLp4DsrpjFGQFApksuusP6g8MOPDn6Paclrk0B/Csz
   44tueG9y5KaEbQgEI5M5fpK8X+lRVFULbpFXjJUCEa3+0HHDlY+c0r+HN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="390046907"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="390046907"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 21:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4814859"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Oct 2023 21:30:13 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 21:30:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 21:30:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 21:30:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oe0S50uSxnTsD5DZjb89CvdIyJEj0eDWhl0JxRkfPu8r//3OVZ3gsk4dIF8r5vFx7lL/rNPh+KR1DMQ7iGwV47QsvmfULqa152zt53JjBFoiUDBzXJ11YLHP6rxJndWEBcVP1rBfUoAJudS+oYnQcB9tA5ucvAzjXwgoFp46U0Ktp+gbWYUKVmIVWXn08IxRKNo0/UjgN5vqJt5k6Ld3eGSNXvMenNCLh+1ozi2tt+BeOOl1h/KAP0RM9HH9BKdSBrwHHMuyDl8FSE19pt+s604dlPql0uU80ovAbGiVBgvAzhar1QDiupsQCaxFkOiif2FClBFf0H8aaeqCLzjdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rxc2o2I3fh6LkhS/Y8IsflbV9qo6r85LZh9DfQFZBBY=;
 b=ROVLAFvr+LZ8V+JBBLYfHSjiNzsTqcnpV9Xi1lAmk8qpKJDnpekRaX/zbXroIE7jHv+ru+FYGbvtrL98DMVGtwOaQ2dKpnHgKegd6QEKX0UhEd2j/bbAlAgDklP/LSxvy8L15r+rp1h5YJitwqGaLVsogUQG6ZYDqsApCCMR4h4Y+ab2BX3cxtoZUZLvW931PMKR7slTgBKBNBi7xJsXCKMMARXy5x8feoC40SWR7bVqA27xFq7b55IAHem/pwEQLvR7I3sJZBuoZqGcFw42BqZvLXTNu/4BcWkRyvkRQ35qPY3KTK2RVyfyCobrT1TJIrvKF6P2+R7HcJXQUkqzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM4PR11MB5994.namprd11.prod.outlook.com (2603:10b6:8:5d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 04:30:07 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d%4]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 04:30:07 +0000
Date: Wed, 18 Oct 2023 21:30:04 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alexey Kardashevskiy <aik@amd.com>, Peter Gonda <pgonda@google.com>,
	Dionna Amalie Glaze <dionnaglaze@google.com>
CC: Dan Williams <dan.j.williams@intel.com>, <linux-coco@lists.linux.dev>,
	Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
	Brijesh Singh <brijesh.singh@amd.com>, Jeremi Piotrowski
	<jpiotrowski@linux.microsoft.com>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <peterz@infradead.org>,
	<dave.hansen@linux.intel.com>
Subject: Re: [PATCH v6 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Message-ID: <6530b0cc703f1_5c0d2944e@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com>
 <3e8aae49-010c-43be-888b-b3ed9ad85610@amd.com>
 <CAAH4kHY_R5-fCo_=n4=k+kE99EVT8m1tcOytK2MUessynE7X7w@mail.gmail.com>
 <CAMkAt6p_mTKrzzQGqzMPB9FU9Nqy9yLJ_tCqFQQ7Q_W12XCkJg@mail.gmail.com>
 <9c55ef4f-181b-4370-8444-dd0b02ba317a@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c55ef4f-181b-4370-8444-dd0b02ba317a@amd.com>
X-ClientProxiedBy: MW3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:303:2b::26) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM4PR11MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 916344fd-61e1-4e55-7c55-08dbd05c1277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmsHvGf4gifalrYbZ4/HnuJjts1KZ+qF3SPJHKhOdB5NRFFvtoTEXNrnvoxapL2gSZk2F8hpSEJIWF//2g6TAFhLcBb78mbqjE2swQYYxA/HJsN2o4U3+lY3UpyhagukLsTl0MIN6QkAexfcMn1X6LlbbHKfmaXNc1UuoYLbLqdqwczZYfb+RTh9Uewdxl/oylFvfggymuZf4fLztyIOCzuP+xxcuoyt7jfSfdPj9lpswNabsMpC+ewr45UZZ/qbaE0Bs0BTdyfLPyN0DofdqhELnesjNK/+g4gIwxQQ5dNyIxiOLTGp2RARvj0k5EiPgnRL+ew9MhBNnS4D67R/iEY+ddoICJ9nOZgTvVqRT1rTs41DlBfN3M8Q362DjY8XOMEGU1pX+vWJ5sHoNq6tqX/jQ/D5bcnRZDPi0RjkniJcdOlF6ms7pe8QbGqtQJtm9iIbc8BsQ2yLtd+0lC75McAaIk0oKfIaCiHtUOI+bGvYcwEMZnc+6VYJ9MNVNwe74Giw+4NkG2AQQzgHI0bR+nF1eRoUsAgQ16zmozLhRCA4bDHiCKOhSpJC2cO1FmSl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(86362001)(82960400001)(26005)(6486002)(66946007)(478600001)(316002)(38100700002)(66556008)(54906003)(66476007)(110136005)(9686003)(53546011)(5660300002)(6506007)(6666004)(6512007)(4326008)(8936002)(8676002)(83380400001)(7416002)(41300700001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3JEbFdSV090aGcwWS9Jckh4ZXZmZ3phMmxSRXpJanJtVEVPeTBIMkFubDBB?=
 =?utf-8?B?WU1veUlaRnJBeGozdWxkaTFlZHpSK2pQSVppNTh6bDJKcUlPNi80cW5JL3Zn?=
 =?utf-8?B?c2JNekltOWpidXpGTk5lVEdlWEhWNmxEZEE2aEtaenU5d3FwTnpwVW85dkVH?=
 =?utf-8?B?UjRObGdtd1hySnhjdWRQd3ZIUlF5TldPS2hmeUd1M1RvNWVESTIwMnAwTnBn?=
 =?utf-8?B?Q29zL2xmelF5dnA4ZzFOamJuak1KZGJnNDA3MzVYa091REU3bnJYcmJ4K2Rz?=
 =?utf-8?B?SFg5ZnZoSnRHOXdvT0hhQTM4OW9hL29sVnhRN2s2dW5UYjl1N3dEZnk4TmJp?=
 =?utf-8?B?ZnpHaURHd0hkWUxFTmN3N3FQdHJzTUNqNmZzcmJpUDVCZGZJa0JycTFqRHZq?=
 =?utf-8?B?MG0xMkpBNm4ybmF6M1Q5UXBMSzIvR3hOM0o4WXVudXp3TnZiMGVNYUtSamVa?=
 =?utf-8?B?TGFQZ0lmNGZTVjhKTkN6UU5JYzR1YjVQc292WFJ2dkhFY2NWcW1VajdFUGgy?=
 =?utf-8?B?MWljSmNiZzJmbzI0K1NIK05zVHpHTzJUSFREVHpaTkt1S3FCaGhJVWR2ME1Z?=
 =?utf-8?B?SlZNRWMybjZaWVoyWkJTdksvbFFYWEl0ZDZZcjYvOG5VOWxhZXk4d2xFTGNH?=
 =?utf-8?B?U0JKTTg4ZFUvVVFMQnJrN3BwQUF4NE1tM2lZV0xISkNLTWM0OEdWNEUzTi9r?=
 =?utf-8?B?MEVVQm5jNURORDU1bVdCS1ZuRnlQb1hHRUdaMWVpMXNoOEVGVXc0Uk50TURM?=
 =?utf-8?B?bzVUb2VsUXBtZXlQV29ZYkt2SW5sMU02dHROVldLcGVYTGszS01GOXpGKzV4?=
 =?utf-8?B?K083RUEvOEVaQ0hyaER0QXNSdVVWOWd4bm1lQ0xGWDdiR2ZJa2NPSUpVMHRB?=
 =?utf-8?B?OENwbFVaYnZ4Smsva1pqM1BQMENuTDBNQnR4bER5VitxUU8xUFgwdEVmTHc5?=
 =?utf-8?B?Y2F4dTBDbGJuUnZHTS9Yc1BqUXFiWEZwZVhvYTliMW1mWWlUblNKbGlKOUtO?=
 =?utf-8?B?ZzRkMlNCZyt1d3YxVHRkZnVPMCtKMHJmZ2FhNm83bm9mUjVjcjg3ZDhOVENk?=
 =?utf-8?B?NlYvZU5oY3VadC9Dek9VTE5uWksvVU5OWVlwTFovTE03QXphd1NzNFg0bWh4?=
 =?utf-8?B?WHdISkw5MnhncUxNaEx2RXZmOFkvSzhhdGNlSGNtVDhyOU5rSFBiSktyT2tU?=
 =?utf-8?B?WnF1dEhMQTdPMjFwNnpmU3ZFa0tza3Zpb3lPYXdYaVVYcUtSa2dUeklQbG5w?=
 =?utf-8?B?ajFDTXJzci96ZlBPTlpmZDF2aXZZMkpnaFQzRlBmUkVtNjRWM3FKaURmZlBK?=
 =?utf-8?B?ZXAraWV0WkUwNGhTL25mb1o2eWVRUnNITlJZMmVKNkFjZ1ZLZXpHOXBMcGh3?=
 =?utf-8?B?NDhCdTFQMUhjTHhyVmxTT0FaajV2UFZOZWwyVDZpZzAwZjg1ZjByakRFeE03?=
 =?utf-8?B?NGZLMFR4Qkc0N0RvM3F5bHliYkdiSTI0b3ZNbGpuRFJyN0xpb1VMOTdaQ2F3?=
 =?utf-8?B?L21nWExFMnRubWo1eXEvd2lpajZ4clZMcnhnQWVGcmhiQXducDdSeEoyZVZB?=
 =?utf-8?B?VmdraStEeHJZZTZpMW9mT0lJWGRQV3hEajk5MHZmT3oydWtUSjdrSndjaklC?=
 =?utf-8?B?OERUNktXRkpVUE1HRUtmM2ZtMWxtL0FFSVcyeDBZaVJCSkowSFE3dlVNb2tL?=
 =?utf-8?B?Nyt4WEdBWXFKWWg1bTFtbEJwZlg2VXordE9BdFBCKzE2blZWNWxJb3BUQ0xS?=
 =?utf-8?B?aGFnbXY4MmFDVXVBekdEeHk3U1pvT0J0Z0hkQVpiWVIyRy8yK1o4R0w2eWdy?=
 =?utf-8?B?Q3FwcXlNaHdJQ0VHdHNFV2VyNDcwME50WC9uRGErY1BCNSt5ZHNVK0VJajBJ?=
 =?utf-8?B?Z0xtTGwyN2JqM2JycVdRSUh2NnJNL204di9ZdzdDbWs2S2s3Z1RQNGNDc3Qw?=
 =?utf-8?B?ZHdVbDVpYTJ4VDNTK215b3VSeXBQMXdjbWd0MUFYRU44ZC84TW1LMmtHN2JY?=
 =?utf-8?B?YjM3eDl0enM2U040VDdmMlpQVWlxOXRFbFB4YlROb2ZRNUp0NTN0anZoY21M?=
 =?utf-8?B?VVFTaTQ0SmxPVGlIbHprcFZXZEwrRHgrODc2M2hORlR2Y3ZsL1JLMitNV3l1?=
 =?utf-8?B?cTRDdFVUM29zSHdNWGRSb3lrSURabGRkclJTYUYrUnYvbjBqZUNYWmdmeFY1?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 916344fd-61e1-4e55-7c55-08dbd05c1277
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 04:30:07.0305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnPUAMfpy90F4AGEymu7nmro+6cS7m6mTUctTjlL/nGWZgF6kVk2/jqMtRFiD0SFC3MVwk3vx+9ImuhSXEq40y/nf4UZg1s2cC0L+rOmbgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5994
X-OriginatorOrg: intel.com

Alexey Kardashevskiy wrote:
> 
> On 17/10/23 02:42, Peter Gonda wrote:
> > On Mon, Oct 16, 2023 at 9:39 AM Dionna Amalie Glaze
> > <dionnaglaze@google.com> wrote:
> >>
> >>>> +
> >>>> +     struct snp_guest_request_ioctl input = {
> >>>> +             .msg_version = 1,
> >>>> +             .req_data = (__u64)&ext_req,
> >>>> +             .resp_data = (__u64)buf,
> >>>> +             .exitinfo2 = 0xff,
> >>>
> >>> Not sure we need this line with 0xff.
> >>>
> >>
> >> The exitinfo2 value had an uninitialized memory bug, where random data
> >> would get returned to user space. I think this is carrying forward the
> >> initial value that sev-guest currently uses.
> > 
> > I think during the initial review I asked for exitinfo2 to be set to
> > some known value initially.
> > That way userspace can tell if the request
> > failed before the ASP was involved.
> 
> ASP or HV? SEV-SNP ABI or GHCB? It is possible to make a GHCB call and 
> have KVM write something in exit_info_2 without calling the ASP. The 
> guest should really look into the encrypted response buffer to know what 
> really happened.
> 
> Anyway, looks like "rio->exitinfo2 = SEV_RET_NO_FW_CALL" in 
> snp_issue_guest_request() is supposed to handle this. 0xff in 
> snp_guest_ioctl() seems to be for something else. May be 
> s/0xff/SEV_RET_NO_FW_CALL/.

It's a 64-bit value and it is not clear that -1 is the expectation.

> And I do not really see why the userspace 
> could not write this 0xff to @input itself before doing ioctl().

If it needs to be initialized either the kernel needs to set it, or the
kernel needs to verify that userspace set it.

At this point I would invite you to fix this after this series since
there is a question about why it is there that is independent of this
series.
