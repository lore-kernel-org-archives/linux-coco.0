Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7479E4EB5C
	for <linux-coco@lists.linux.dev>; Thu, 28 Mar 2024 06:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711607386; cv=fail; b=LDqQw1Eo3PtGCd2w0N1vnDA7HOalg2dJhzVq/LlG1qhiCUmGQJfairR7JV0gJ/1PJOAyspAtm+PJPWSGsh8F1HHNuNEdm6pnmQb3mHgbEBALni1v3NL4tiCX9pPO6BjY+vwwxOCeBes7gSxsSFFJT1Y5cyrt9sxNfSl6/KvRJ9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711607386; c=relaxed/simple;
	bh=NsPCJyop41b0bnwXeGMp7HqauHo7BC900b2rH7o3zuQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L5oGEnDYyQWdzrk3zmMhKCzGNZYeO4hRHqsGpLh457F7U1xGXvUBnJjcCNtiV1Cr2uBYbCo/0tBlsfiXJHQhx/BU6VIt7OwDP+m91T3VetVzMpGF+15X/vVEFnsL7EQcgL0+iGzC1Zb9RhDmVBxIMjOParxasxt03fJTmi2EAB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAlhBBTB; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAlhBBTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711607385; x=1743143385;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NsPCJyop41b0bnwXeGMp7HqauHo7BC900b2rH7o3zuQ=;
  b=nAlhBBTB6DhrRbhg0fmrTpFGKnOj0UBi0dlLt+/CeZ4Cmj6qB/sj3O7G
   rUcnAtVYrVB7jZ6x7rtEAnAS6wi8YBMWhWFEBzdC1Twyf9kZxXMUO/zlg
   03IQH56mG0g0Px+6yLrfvAXRJKr5vEZMAt7UzT9haSaE09B7eSq3G9EN5
   elQUnG2Q3KpaD9naXJr0vyrbG1B8R6MpPu24j57ULHkCc/56AXIpLejCo
   MXBuZ7YcZ8jsbfa1l84SDYcnty5drupViIGREKo+VWHFYuMZtXDTBKj0J
   B31Jue3OlYTpzs2jPY8mLsfUF1HQzTyytmHsWeoRO2w9svqrlQpgDtpKj
   g==;
X-CSE-ConnectionGUID: KiYUvfA4QjirI7AdkTZr0Q==
X-CSE-MsgGUID: dErWawtdReGjXr+f7RvL9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10550389"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="10550389"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 23:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="53991954"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Mar 2024 23:29:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 23:29:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 23:29:43 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 23:29:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJcfMBKUysnlIAZQ1RkVlHtDaFfixcIQ2qEx4yt7dYK5kirKEZWRKDu0dtQDHZEyEVRW/go3H21Rs6JjZLjc53JEFosTu3F1X6vkfT/luP0K3MH3bfHXW8eTkrzsWCzmY34QFJe9WWYlSK9nkiETsanWEwxNDr1vYgo6FyyDgs06FtvtkzgY9J/44mT3AH1BYosJxgyYVgXe+uu5aTbFiA9N8X/9WRNzH5k4rPsBeVEHIozb0jQ6UjEddtLwOONC3tZXIFbMoIE/4c9Ajruvw/xfwaV2XgP6PFsxZ4jChVeClc9zttQcGYmul8CYQq3+wbX+iFN2Xmxn2pjbn0NcSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsPCJyop41b0bnwXeGMp7HqauHo7BC900b2rH7o3zuQ=;
 b=VKPIHj855nHaIx8KQez0KTJXLM5sLxQhVxODdFPYrMIh3LwuRNBkUuLm11biMimpYA6XxovVf21BksbRS2asWKOBdDYZfqlq4OMUGBlAQU8r/exq9MxL1Qfy3+YFWE7nCtZCcLWXaBoGAHN5EtJEmMGIY/90uk6mGYF5YIk3APZGX666K/08TwQLu4NV/w52Pz5K1sjdH5ObVZVw90ByLHua73L7FRVqmMNIiICEzxlgOOOE2zUSJZG0OU0pfiqWuxdue+d2d/DH+hBRctqut1kfNm4ZEgaQEMel4+CuDr8ea5GUSlBovfiNgbDsnc2sdB6tS/pP+r75azlotc3UXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 by LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 06:29:39 +0000
Received: from MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::5961:3bac:e9a7:5795]) by MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::5961:3bac:e9a7:5795%7]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 06:29:39 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
CC: James Bottomley <jejb@linux.ibm.com>, Claudio Siqueira de Carvalho
	<cclaudio@ibm.com>, Joerg Roedel <jroedel@suse.com>, "Lange, Jon"
	<jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>, "Johnson, Simon
 P" <simon.p.johnson@intel.com>, "Reshetova, Elena"
	<elena.reshetova@intel.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, "Yao,
 Jiewen" <jiewen.yao@intel.com>
Subject: question on vTPM interface in coconut-svsm
Thread-Topic: question on vTPM interface in coconut-svsm
Thread-Index: AdqA0eAumCfddllhSAC8Bgc8QrCrvQAB1U1Q
Date: Thu, 28 Mar 2024 06:29:39 +0000
Message-ID: <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_|LV3PR11MB8768:EE_
x-ms-office365-filtering-correlation-id: a68a270b-ff10-4c0e-ce34-08dc4ef0722e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: su9bHlTwq2fSPAyAuYnWctKfutnRVR04tbRBRB5FZQairzqiDCY8VcklcweBKOl9kZoMzCzmPpzrZk2mxQGyEbWPOzNZ2TeJ6kIQA4MkvSsaTRepA1vNAEnjRAWb34XxgxsDL7FyByN7zdinga17NBNdOgJfDN3TzWqappCQ9jta+gsR3NzyXB0pDKrOxfh4Exc7V8OscnoEBnPEeGYYtHfFmpD/38ZQX07zC320abZw+QzVjcoxS3oNvsO+6hqgbcG4o3vh3njrHHfDPVR9mb3mzTZfMrmkrnOIwc7OmmuXs7m1+XIM/E/YCoN+Uv+s9P0SKI35Y8CqgDj5fHd6dBah12sCwf9iAYFbHrnNPOuYvKt/DQf4QBB/9jd2kUpBvFFYZkKJf/TYJTBZvhSgRpVpZoPpcG1jRT6+Xc42yvaDxG/5GGAz5ttrfUSRU6RPHWZFz5dw2CzFEDOrfT+ME081Ka+UmZU3EiyeP5xAHXY/VORjkKI7Rki8YrWzcG/EYmVc9FNgkK9Fm+NxBXmnZ2E7BHDpxeDYBGq/7FKPvJkDilEuJQMiX6C54Abq9R0a4rXlDCu1tC6vhUDWyb3ocKwWrJzvioUUNvdtXaJqykHfqfITw/aNt5YLgTXnAxasedzPBHEXt2VNNAvY2M/u826csozJ+eFKptTpmVwHNnP7CIfgGyU5L5e05bV0ghoa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5872.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0f4KfwA54AzRTHX6nBsXHNQkZZ0wZgDMpXpoQV7i7GnzUXEvkSQJdRRXukFa?=
 =?us-ascii?Q?/5eTr30GfQhmkXjCKh3uHk7hKXhVNZzJeCb6L2vhneAS+bgaExREcOsacThU?=
 =?us-ascii?Q?YvWXNhj3HVBG0mhPBAlLdM55AzflsaQ0EqkHa8DCJnDqKv8DayXHj0gCIS0z?=
 =?us-ascii?Q?Juar93XB62lGqY1EAFER17oJHeOVDxKYrATy+LwOUGgs+e2bbUL/ZEDPuzg2?=
 =?us-ascii?Q?7spq96jv7/q2hXfAK0T6ju5ixsaWUbMfRUqk6SCTo2QdVQ+aGar8YMeXIFZV?=
 =?us-ascii?Q?KlJ4CnVMaLCQXt6Q8CKMX9zj2JIJs8jKj+eBZRELctWtw/2dVC2Q1YrF5BQM?=
 =?us-ascii?Q?NKQ9rBCYMgvSLo63Q7Wr86uGTBenq5B9XIv0gqgPejaAQk4+a5rTHvHBXVOV?=
 =?us-ascii?Q?fCnGCm/oxtQRJ8a5O+ZFyvVobqiIARRDZ2EHxM8BDYJO/k4eURu9tdgJFYzE?=
 =?us-ascii?Q?ypgLACrFLo2jW1VDwQ+k9AJC41gZirLhrj16dL+AP11jhX7bSYOD0GMqQchB?=
 =?us-ascii?Q?URUUKgiTMzOgTYev2iHmU2QXlJ1468UQbxBnrkjJS0/ERxYpdhtAV5L0J3ue?=
 =?us-ascii?Q?rTA8Lyn405aZGCmiWHAEXgGOUAaQYQJH5ni4BT5WBbefA3QE/M/UWUPpAWOK?=
 =?us-ascii?Q?wQzjkqsJQ3tSMXtgfta8qP7A6tW3EyhplsGciTktNqhIXh0KqtzcjwLET6RL?=
 =?us-ascii?Q?9ikOWYsDC0tDiyK/ePGHkld/RKFOg+ReOpgkZk+mU75cRFPSYXG8w96ZsEpt?=
 =?us-ascii?Q?bZblc8Gat9dgH4icVKysZnXmGjv8rcPB2Dw4nqve4YgWdNNYUmRqSv3BbO7x?=
 =?us-ascii?Q?ImL6kFn9nd2WDQhbZWKvTGfCyyh3ojyEEpwacVRrbJUKjRGLfWYM6No0AN+6?=
 =?us-ascii?Q?aP8XBgX9mq86BioFR5eKknJ0FXtadZDoDmIEf0yi1l7uJo6jOtcEIv3BZRz8?=
 =?us-ascii?Q?XItrAk/x+GkwrQAgvp0mKLrotvZOVpAN05DmgT74gJNpanBJzaNvdIsxBi/Y?=
 =?us-ascii?Q?Nqt2OFgmW+733F/wGDrqP0+zVQd2DLEIwZZkfmOtrs6ohoeFfdUUu9ceBnZN?=
 =?us-ascii?Q?2nEYZPmLp7LWv+OAjPlXwclwP+DEjcdkatEqUJTvYYTz09alZYe23yDJxkKh?=
 =?us-ascii?Q?RXegI4zgv0U5zqBWOik4+1OCTwV0XB3lAmUI/X+aLcK8Z/5lCeAX01Owid3Y?=
 =?us-ascii?Q?Ew+NCav1vkAKMtZM659BUo/lZ6aWO05SxE7DOIeU/c1Tjo72QALsL1KNPc39?=
 =?us-ascii?Q?yQ7JPaaGBKy2HvNPpwdvZ22OnNBmo9Pf/sLj71KPITuVLyqkzngm7XqjM7yW?=
 =?us-ascii?Q?QwlIOVbCqBPP/bENPLSrDGN6zhsNLGxHonC6FVKIQc7DuwZoWBXefn0MzooE?=
 =?us-ascii?Q?LX7ULcRw2oRkG5CNc0wvOKWbOtWBFYdVVCSprVuGmTLAXRu7PNg72Cy97n7Z?=
 =?us-ascii?Q?FU7Zq3pK68wcDb2gHx8v1CPBYth/JLG9EnH28dDvTE+quJvG1hKbCVlVhJ/o?=
 =?us-ascii?Q?WwvwQQ8VFxznHuq+nTOy0qfm9ARk704h+plRAeutOTrwIZDEnEvwj+49DgqE?=
 =?us-ascii?Q?FJUnZFUiOYxrnP355yPNxxbJgx9Igcc9dLOAR4tD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5872.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a68a270b-ff10-4c0e-ce34-08dc4ef0722e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 06:29:39.4503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6p/UK2P6vtvNqY/qPRi+uWoLvPlcMxRC2hkeOrzCs8QsyESy2/wBOZTAW70uJNaBQukEgSBQvGn8PXktfBl7SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8768
X-OriginatorOrg: intel.com

Hello
Since Intel is planning to use coconut-svsm [1] for TD-partitioning, I am e=
valuating the vTPM support for coconut-svsm and L2-Guest for Intel TDX. As =
EDKII SecurityPkg and OvmfPkg maintainer, I am also evaluating the impact t=
o EDKII project [2].

Currently, the PR for vTPM in coconut-svsm [3] is using the AMD SVSM define=
d vTPM protocol - SVSM_VTPM_CMD Call [4]. It is a brand new communication m=
echanism. As such, we need a special SVSM vTPM driver in EDKII OVMF[5] and =
Linux Guest [6].

At same time, we have also prototyped vTPM support for TD-partitioning base=
d on coconut-svsm [1]. For vTPM interface, we just reused the original TCG =
defined CRB interface in TCG PTP specification [7].=20
We modified coconut-svsm to provide TPM CRB device model + TPM2 library ref=
erence code. It is similar to [3]. The only difference is that we don't use=
 vTPM protocol [4], but use TPM CRB interface [7].
We mapped the TPM CRB MMIO (0xfed40000) as private MMIO which is only acces=
sible between trusted L1-VMM (coconut-SVSM) and L2-Guest (Linux). The untru=
sted host VMM cannot access the TPM CRB MMIO.
The TPM CRB interface is reported via TCG defined TPM2 ACPI table [8]. The =
TPM2 ACPI table exposes StartMethod as EFI_TPM2_ACPI_TABLE_START_METHOD_COM=
MAND_RESPONSE_BUFFER_INTERFACE (6), see [9]. And we don't need _DSM for Sta=
rtMethod, see [10].
After those change, we can run vTPM in OVMF and Linux Guest successfully on=
 top of coconut-SVSM, with minimal change on TPM device driver.

Questions:
With this POC, it seems TCG CRB interface [7] is a feasible option for vTPM=
 in coconut-svsm. We are NOT clear what is the motivation to have a new vTP=
M protocol [4].
Would you please educate us on that? Why not reuse TCG CRB interface [7], b=
ut introduce a new one [4]?

What is opinion from Linux TPM driver maintainer? I believe we would like t=
o align for vTPM support in EDKII and Linux.

References:
[1] coconut-svsm, https://github.com/coconut-svsm/svsm
[2] EDKII project, https://github.com/tianocore/edk2
[3] coconut-svsm, vTPM in svsm, https://github.com/coconut-svsm/svsm/pull/1=
35
[4] AMD, SVSM for SEV-SNP guest, https://www.amd.com/content/dam/amd/en/doc=
uments/epyc-technical-docs/specifications/58019.pdf
[5] coconut-svsm, vTPM update in EDKII OVMF, https://github.com/coconut-svs=
m/edk2/pull/2/commits/ca0e644c1661c4ad10c2533dc3c360faa203625e=20
[6] coconut-svsm, vTPM update in Linux Guest, https://lore.kernel.org/all/8=
26af61ac2097a14eee0d81cb869eba9c4fdef8b.camel@linux.ibm.com/, https://lore.=
kernel.org/all/20c7dda843f93b22f6c6afca3820a53d669503bf.camel@linux.ibm.com=
/, https://lore.kernel.org/all/83bcfc398d885f9e42d5aae42359fe02ab12d306.cam=
el@linux.ibm.com/
[7] TCG PTP Specification, https://trustedcomputinggroup.org/resource/pc-cl=
ient-platform-tpm-profile-ptp-specification/
[8] TCG ACPI Specification, https://trustedcomputinggroup.org/resource/tcg-=
acpi-specification/
[9] EDKII, TPM - TPM2 ACPI table, https://github.com/tianocore/edk2/blob/ma=
ster/SecurityPkg/Tcg/Tcg2Acpi/Tcg2Acpi.c
[10] EDKII, TPM - DSDT ACPI table, https://github.com/tianocore/edk2/blob/m=
aster/SecurityPkg/Tcg/Tcg2Acpi/Tpm.asl


Thank you
Yao, Jiewen

