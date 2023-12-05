Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CEB41239
	for <linux-coco@lists.linux.dev>; Tue,  5 Dec 2023 23:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+O+D0Io"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701820731; x=1733356731;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=//S91w2Dl2zlW6S7/FtaNdFv8O1Voy3PPY4J/Y8lKws=;
  b=H+O+D0IoPHqmLDmjsiGNNOs5XBwz0Pj+DtM1fT2hOBkIMODd8epiAi3B
   gUUJHRtWX80VSaR7NuWXdXO8U5w8Z3kV/BniVvW6Sl/JG6gc6jwZ5i7FG
   9BSXR7J217CCECbIiQ5trOmSMmOX85NFbL6c8Ly7QKgZCHeg9Qu9T6eBZ
   i4zA5/hhWQKzqwdFh2TiEscnBM2T4gYlqCGZPeyufQYqm7uZaYeUyJi/z
   AcfqJgpIxS26cfgMKCG810GI3bXuxolx+v8Fgd3BVINIhVfkodvfA2apZ
   NwkVJ1TWBu6hV8R97KuqvzhaAZHtIELxE4Cu1Wpe7rvcxxITbSiyGFpxv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="373438310"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="373438310"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 15:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018379438"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1018379438"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Dec 2023 15:58:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 15:58:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 15:58:48 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 15:58:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3fBkkIuLbOC0l67EQ2PA7ys0aSi9w/6wPNkfuZ+iiAqhOl0Otnqw6QTiVTlB+lGvPOv4b2rjjM/XCZgcnjszUZrQDkTD3gR0hcddHMPsB7isk99BOn8BGG7WJNLeRquvlYObIAak1AyP7sFpqptiM0eUtnBulXvj3XyLEdPBggRgnPI8lRFFQCCXpa/GA53JgXe1vWRa5BIEv/Eq2UkXf46IoLkq3J9ObY39dlBTBc7JhMGdJhDffrhPP8Kc3OMfU6lOrfaBlMEieKf4xFCsapcamjZt6ao+9FIn/+3XQpCFztLaHFwJLZlcnqvMR/T1komYcxGa0OkPhdftYgTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//S91w2Dl2zlW6S7/FtaNdFv8O1Voy3PPY4J/Y8lKws=;
 b=EAM3ZBTGoTzQKbbspnKuiY31YlF++9atzLAVoU3xIG3qT3iX0eYCeIjw8O22vhdXj7l0PSEgVOnExOakTvJ1yg273UW6mfYjMxEC7HnyXgUOKxmcxGcChdHeBQ0tB5iTcfdJR/y1w2Ub58VGT38WAWM4U4ZGX53J5WagYniPwAhpuo5m/VdfSGQQ/xxBOjJwGiaHyOdxSipZEl8vuPUlRFvv2/7QhBbwzD64wu5zRisHZKOKLPPpUc+/7/Hw3p0PLl1wKkrL1IxYLZPeUinAt2Uqge92E4K3tr2tdIYYRksZF7fe3a6qhpIrQny3gD7z/qqeEVt5T2urfZUVU7Tscw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by IA1PR11MB7678.namprd11.prod.outlook.com (2603:10b6:208:3f4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 23:58:46 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::5d1:aa22:7c98:f3c6]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::5d1:aa22:7c98:f3c6%7]) with mapi id 15.20.7068.025; Tue, 5 Dec 2023
 23:58:46 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Reshetova, Elena"
	<elena.reshetova@intel.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
	"rafael@kernel.org" <rafael@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "sathyanarayanan.kuppuswamy@linux.intel.com"
	<sathyanarayanan.kuppuswamy@linux.intel.com>, "Hunter, Adrian"
	<adrian.hunter@intel.com>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "ashish.kalra@amd.com" <ashish.kalra@amd.com>,
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>, "seanjc@google.com"
	<seanjc@google.com>, "bhe@redhat.com" <bhe@redhat.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCHv4 06/14] x86/kexec: Keep CR4.MCE set during kexec for TDX
 guest
Thread-Topic: [PATCHv4 06/14] x86/kexec: Keep CR4.MCE set during kexec for TDX
 guest
Thread-Index: AQHaJxRjCrpZEPs+S0m2hHcn7IWK3rCbX8iA
Date: Tue, 5 Dec 2023 23:58:45 +0000
Message-ID: <861f583e2550959616e19565235f0debbe27149b.camel@intel.com>
References: <20231205004510.27164-1-kirill.shutemov@linux.intel.com>
	 <20231205004510.27164-7-kirill.shutemov@linux.intel.com>
In-Reply-To: <20231205004510.27164-7-kirill.shutemov@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|IA1PR11MB7678:EE_
x-ms-office365-filtering-correlation-id: e0315513-1beb-43b4-e3c7-08dbf5ee1e19
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zXRkODadw/MUPkeInb+bRWNUIG2MJF6TGYRli42/kD6CpbUpAnLtDiT4ZVglRLs5rV/7/TWR3xZyzU2KAQFfo1/IY5Sol7VzqVLgEg8ZqKaNMBvnCXq0HyqFrptwTZ8vkFguusYTW8bTHKqv3O6QtQlvLmp0D1V7LKPz49wMgz33n9s4qSp/I/vW+5LTCuOb9pVDCWuIjW/ypFauZd/DK4Kgq0E1hDpyUgm9E78+E8bLnX+USeUJ4xXKge2Q+VU/Y4dC4Q1+oQw20vJL13KGFpziDOfdlrBnXuSsmlMNxvR8QV8Z3jwQ4vKNbE+jYuiN2u1RjwMEaxVcDVbyiU0sfyhJdc5DZoMPGZaWf6mdO2xKSKfF9+XPXlQlfsHj3w/G8tCqdQ91NM2AJri+2ibA19YhCimUncwVEOkZehl1R7whvxUoyCVsMWwVhiH4reheOWaBN8llCuZBi7i8WBuSMgl7fby9iAjRbfNyiDIDU6vIFFhoeP+Aws5sadvlhhSOY2Z+gYhXQ+nEvFEVLZfpDVTO5NtTnusGjbu2wAoargLAYqTOmRXYTX6xS01iOtaV1QwebocVbMgIiSM9vsbCmO3Fwdt2+3H79SX1cMdGXrjfqkOlyDVOrgJbboRfrNRP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(346002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(66946007)(54906003)(66446008)(76116006)(110136005)(64756008)(66476007)(316002)(66556008)(91956017)(478600001)(71200400001)(6486002)(38100700002)(7416002)(5660300002)(36756003)(41300700001)(38070700009)(2906002)(86362001)(8936002)(4326008)(8676002)(122000001)(2616005)(26005)(82960400001)(6512007)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzM5V0RkSnNOdWNpNy9VK1IyREtzTGNCVjI0MHJGOG9wMERtZjVHbnVoV3JS?=
 =?utf-8?B?OEcreFJQTTk4TWlvd3crdzZhdjlFc3F1R2tTUnJMMHpCenkvdVRMSkdhdHFy?=
 =?utf-8?B?QTVaczdoSEFnMXJPSzgwSGc2bTZvaldjaEVWN1FpZTBsMGFRMENvYTg2cUpu?=
 =?utf-8?B?a3pKQjNlbXRYSXl1NmRLRUJtNzZoWFl0Tno5VXJzODJKZ29WTHB5SUxBYjJF?=
 =?utf-8?B?ODJIVFkxaVI5RjNQMnRXMytkdUtCNkVkUlpYK0d0cThveUhqOFNLbG9rYmxN?=
 =?utf-8?B?QzRRUXRvNlJqajg5T2xYTjRyVFN1R3FGS2REem1NZTNvUmI0MUFBVzQ3VHAy?=
 =?utf-8?B?aTdvYzZNRnpvNFdWdUpXNUNIbklkYlFqc0hSRTkwQ3ViRFpPd3BmcXNRTnlU?=
 =?utf-8?B?TlBPWGNtVllZbnNkU0pEMGFmSW5OeVhwK2RYZFI2MGFrM3FuejFXU255blZn?=
 =?utf-8?B?Nk9Xc3ZXdTZieWxyNFhLZm1JZld6SkloMVN4eG01d3Fyb2VNM1Y2bmdtNWxV?=
 =?utf-8?B?RnZtVHk0OXdWZ1Z3WE5pc0RrK1JFeHhhNW5IWWlFVDZoYzY2SEpkNHZGc1VG?=
 =?utf-8?B?ZSsvdnFSaWZTOEM5azd1MmtwRmpVVUxjcWRHcjRDN3NoN1prbU1qdUhkaExB?=
 =?utf-8?B?WGlSL0c1c21zZ2JJcmw4ZjJQUmdlekE4a1A0cDNIb3JYaW9qTFdTNEtCVjJP?=
 =?utf-8?B?QUJ3SGtJY3pRMXVlMno0WVV2M1Z4dnBzTVREMFBZbGt4T1BSUytOOGdFblRN?=
 =?utf-8?B?QWlIOWJVekZDZnRyOURrWVp2d05td1RvN3lpeUQwanRaR0lyN3pNdTNOTmVi?=
 =?utf-8?B?UWNGYzVXL0R4OGFRUW9Md1pMZ0pyRzZFZHNvNDhQeHRLWkF5Ky93RmY1QWVw?=
 =?utf-8?B?bTM3d1pNOGNxSExrQitLM3UxdTNZL0YrMk05NU5YdmlwM0xDTTdRamtCVC9m?=
 =?utf-8?B?U0lSSVZRSzZjWUF3a0ZmOXR1U3NHMEJQbDdHVmphblVCbGVtZHdqVjlQcGNp?=
 =?utf-8?B?dzM5aWhMMklvNmRGSlI1M2VDbmZoM3U1UkJvT3RJREh2VVYvKzNOWk5hdW5t?=
 =?utf-8?B?OHdoL3Zwby9NRmxKUjRjTGEyK1E0alRGZFQvSWNEcVVYcEdhTVF5MHBmRzZk?=
 =?utf-8?B?VVVZVmpCRXkwVXY1RlhvakxxN1hnMTdTYmVOdk4vSlFRY2xxRkd5UG5raHVE?=
 =?utf-8?B?eVlCWFMyemdocHB0ZnNoRUhFVkpTZWxGaGJseThkV3gvWG9GQmx4Zm1hTG5t?=
 =?utf-8?B?Nk0yYUFoT2NUR09MQjFkSFpwSDRNR2huOWRVYnVxalJncGJPZWFoc3I3MmNP?=
 =?utf-8?B?WmZEdURvS2RSRllMOHhpaXJWMkwwcFZkOGlyT2p4RGRYeFdjRUpJMGtFUWx0?=
 =?utf-8?B?WlkyS25EQTI4Z24yczdpQ0xiV1RtNUxycVdwSGZNTy81b3hYeGhlQjFCT0Iy?=
 =?utf-8?B?ZnlBd3Boc1MzNWE0b2diSnEySTJES1hSMEJhV2poUVdXdmxjYVl2am1PeHlq?=
 =?utf-8?B?dkJtSnlCdTdnbkZrVFBvS1JlWUhjRUY1QkdKN2VoUngrMUJNVnhlTmhUL2Jz?=
 =?utf-8?B?MEpCUXR3SHRCMzVkVzhIYVFpdnpuc0dGZEFpYmV1NGFUUzlUdCtVMGY3cXlM?=
 =?utf-8?B?dEFaZ1FYVGpUa3ZHRGszcEpjQ1B6Ym9YT2cyMjZ1dHdObnJ1MEtpYVlFYmFz?=
 =?utf-8?B?UGhpb0lYQVFFdEw5eHF2Ti9pZTN4c3NWZnhHQjV6clIrRkJFWEJsdDJDVGtN?=
 =?utf-8?B?d08rOEZmMkkxanlYMHRrMHd0ZFp1L0FnUkpyMVpHM1llNklUQVpNVGtCamE3?=
 =?utf-8?B?WHQ0SG9iU2V1djVkQ0RCY0FqQVNGWjZHcE9xK1pZVkpRaW1HYkxqWmFJRExr?=
 =?utf-8?B?L1FFdFNzeHY3aEg5SHM1RXFYemFMcFRUUExZaVBsWFp1aS9UdGhXV05zdXVK?=
 =?utf-8?B?QUZjbzNHeURuQjRUYzc0b29jbHJKQ2dDZUhWREE3Q0hSK1J6RVBXUTVhMU53?=
 =?utf-8?B?cUQ2MjA1alQzblAzZ0xYb3VHOWEzdU1BVUFWd080emxpOFhLUUVQc2llV29w?=
 =?utf-8?B?dDE3WnpCZjVjMzRNcGppZ0xhL0Z2MUZKcHZMUTNlZVErUTNZb1p1cHBYOG16?=
 =?utf-8?B?T0h5QmJGTFM0SGs1ajBaZDk5RDBrN1lMbkh3dXRDWHhoNXcvd1R6SWhmYytp?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <627B8527FF49954F99B76A67238D8055@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0315513-1beb-43b4-e3c7-08dbf5ee1e19
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 23:58:45.8549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: epDx9PfuvZ83pQ1wfzmOLNuSC45omJVGNkxBvWl/i1NmiOGsYRT9sCT5lZGn4axOxYUqIDhZGgPF8vEY/PcauA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7678
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDIzLTEyLTA1IGF0IDAzOjQ1ICswMzAwLCBLaXJpbGwgQS4gU2h1dGVtb3Ygd3Jv
dGU6DQo+IFREWCBndWVzdHMgYXJlIG5vdCBhbGxvd2VkIHRvIGNsZWFyIENSNC5NQ0UuIEF0dGVt
cHQgdG8gY2xlYXIgaXQgbGVhZHMNCj4gdG8gI1ZFLg0KPiANCj4gVXNlIGFsdGVybmF0aXZlcyB0
byBrZWVwIHRoZSBmbGFnIGR1cmluZyBrZXhlYyBmb3IgVERYIGd1ZXN0cy4NCj4gDQo+IFRoZSBj
aGFuZ2UgZG9lc24ndCBhZmZlY3Qgbm9uLVREWC1ndWVzdCBlbnZpcm9ubWVudHMuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5p
bnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBLYWkgSHVhbmcgPGthaS5odWFuZ0BpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgYXJjaC94ODYva2VybmVsL3JlbG9jYXRlX2tlcm5lbF82NC5TIHwgMyArKysN
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rZXJuZWwvcmVsb2NhdGVfa2VybmVsXzY0LlMgYi9hcmNoL3g4Ni9rZXJuZWwvcmVs
b2NhdGVfa2VybmVsXzY0LlMNCj4gaW5kZXggNTZjYWIxYmIyNWY1Li5jZDZhNTM2NjdjNmIgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9yZWxvY2F0ZV9rZXJuZWxfNjQuUw0KPiArKysg
Yi9hcmNoL3g4Ni9rZXJuZWwvcmVsb2NhdGVfa2VybmVsXzY0LlMNCj4gQEAgLTE0NSwxMiArMTQ1
LDE1IEBAIFNZTV9DT0RFX1NUQVJUX0xPQ0FMX05PQUxJR04oaWRlbnRpdHlfbWFwcGVkKQ0KPiAg
CSAqIFNldCBjcjQgdG8gYSBrbm93biBzdGF0ZToNCj4gIAkgKiAgLSBwaHlzaWNhbCBhZGRyZXNz
IGV4dGVuc2lvbiBlbmFibGVkDQo+ICAJICogIC0gNS1sZXZlbCBwYWdpbmcsIGlmIGl0IHdhcyBl
bmFibGVkIGJlZm9yZQ0KPiArCSAqICAtIE1hY2hpbmUgY2hlY2sgZXhjZXB0aW9uIG9uIFREWCBn
dWVzdC4gQ2xlYXJpbmcgTUNFIGlzIG5vdCBhbGxvd2VkDQo+ICsJICogICAgaW4gVERYIGd1ZXN0
cy4NCj4gIAkgKi8NCj4gIAltb3ZsCSRYODZfQ1I0X1BBRSwgJWVheA0KPiAgCXRlc3RxCSRYODZf
Q1I0X0xBNTcsICVyMTMNCj4gIAlqegkxZg0KPiAgCW9ybAkkWDg2X0NSNF9MQTU3LCAlZWF4DQo+
ICAxOg0KPiArCUFMVEVSTkFUSVZFICIiLCBfX3N0cmluZ2lmeShvcmwgJFg4Nl9DUjRfTUNFLCAl
ZWF4KSwgWDg2X0ZFQVRVUkVfVERYX0dVRVNUDQo+ICAJbW92cQklcmF4LCAlY3I0DQo+ICANCj4g
IAlqbXAgMWYNCg0KTml0Og0KDQpJdCBzZWVtcyA8YXNtL2FsdGVybmF0aXZlLmg+IGlzbid0IGlu
Y2x1ZGVkIGluIHJlbG9jYXRlX2tlcm5lbF82NC5TLiAgTWF5YmUgaXQncw0KYmV0dGVyIHRvIGRv
IGl0IGV4cGxpY2l0bHkuDQoNCk1heWJlIGV2ZW4gYmV0dGVyIHRvIGV4cGxpY2l0bHkgaW5jbHVk
ZSA8bGludXgvc3RyaW5naWZ5Lmg+IHRvbywgYnV0IEkgc2VlDQo8YXNtL2FsdGVybmF0aXZlLmg+
IGFscmVhZHkgZG9lcyB0aGF0Lg0K
