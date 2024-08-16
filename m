Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21BA26AC3
	for <linux-coco@lists.linux.dev>; Fri, 16 Aug 2024 03:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723777760; cv=fail; b=CdCX57f/IYnfjTOHoGLzROGn3EaMUy4HpUuMxRgI45jGACUSpYPpaGItmHRd7tqRzPQ26+JknkkMjOi/ItM1ijrQFd014q7ZIts5n866wcmJvk3Z/To3S6onrhAEX+SKaQYUqAQC7/r+AAJhH4Po/eiJGFJRgYobkUVW3lo6Hb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723777760; c=relaxed/simple;
	bh=daR0zpwo9u2WmFAxm5x/jy4jetJUiIdJpBEtKkMYBm8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GGxmfiejC7yHsz2qNKhuYw5hBiTX7/zf+4otW9y+32lnIFYd91RXdZT7zEZB7+wJkcZOJmHSwenbIVOTEE8FvMe1daQyGG6t+JfByHdvZ5ORDlrNVyXr6LZMLPWKUVKZSNOUi0Oyzhg9OVRRv7IeUWi+AtRGN9m2s1KA2DiSaaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuk96EvZ; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuk96EvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723777758; x=1755313758;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=daR0zpwo9u2WmFAxm5x/jy4jetJUiIdJpBEtKkMYBm8=;
  b=cuk96EvZE3CoHmKLI1yRWSATCuSGjpzQletaNFtVz8eZNwwaqEjFWiDV
   wyx9wFD3UEwCWIkjC3pMivzTqjgEeloPTjmvnjo51YLg16NB4rLV/r0Mk
   NFxzGZ+QucTn2viQTsVLjIvKOWTt3SyW7TT3RA+gEvHEdjLfG2L98VvYw
   MyFPJGHf/VNMbLS1gjfhKJNeKIAcsVeExzAqt+ftFTktpUw/jZ8+MPL5I
   UYjyHJk7/E5tBFJg3gWyAh00EFURbrz+rqnACuUy++tiyC7CHQC7LpUA1
   ny542KwnuvMBGYpkXQO+u9bw2COC2PvCP7mp1t3WSgYayvPZoK+dnd1Hl
   Q==;
X-CSE-ConnectionGUID: lLfSrM0sTq6WKnJxnhPZ1g==
X-CSE-MsgGUID: q8d//ScGRKa1fh2l7TEGgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22034088"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="22034088"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 20:09:16 -0700
X-CSE-ConnectionGUID: YT6/jCt4TQuqSptZU5XDlA==
X-CSE-MsgGUID: mm4PJZjhTxm8V3c7/r91Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="64438654"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Aug 2024 20:09:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 20:09:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 20:09:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 20:09:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 20:09:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySHmiKfY9YZJxA8RCS6bYRIHiA9XCUn0iOouKWvH1BrIMFIKCiivMG4JBn+fAItx0Ja5wjX4nvxYpmZu7pxRa5wtN+rS6iaqiMlgS39Ld0T62QLF0b3mJjcrCjIfUPJa2JTXcdQRWJHiox++yY75cH+MkcPGKbtVUndLbvbt0cOcl8jiBlNZGJW4zekAHtU1l6BnqG/Q5oVr96Qa7gdrRJlDDEwWxdnrErg9+nd1snhA7Kq1VF7XOMkSB5bFIBolm9i6ary6PAOxwoHk/tnu1vnto/PjMhYyGdffa1GBxmLjj5P+UKTd85CAJ6PQY6XOTZu3zzx00ZDDg28kzxbQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18Npg5PU+2vFCV23v/ZtHZ8Q0AZdBLBVdo2jsLLyi6Y=;
 b=qDqtAAvqSAIud/1YsfkHj+59Sph4J8YtvyTbzOEyhmkoVQLfgyrdmm/tqJRpJkr40rCAzz6S3SiRGIV48H2HwwXDQg7Bx/sI1ru33LxPK3G8C1is9OfBCXsKZKX2hy+dGvcn3qj9IlIGnRX9E+ZMxFwHjoEtobM5KeXdlLvthbBcp5Cw9PsxUmn48/4AxU2dU0+hfezRtOfWbhmqLQ/JWfZtGZsTmMktn/EkiF3J/NpqMqf8niu3WQXsum02zav3cHdpSbGwypUk8SrHvf6piQu9EOD5Cxzc2WQUA6dmJB+pX/P3ysUwHGYHE9zyy0EsYcIay+Q4HSOG0/JuNGH9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 by LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 03:09:08 +0000
Received: from MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2]) by MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2%7]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 03:09:08 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: "Reshetova, Elena" <elena.reshetova@intel.com>, James Bottomley
	<James.Bottomley@HansenPartnership.com>, Dionna Amalie Glaze
	<dionnaglaze@google.com>
CC: "jejb@linux.ibm.com" <jejb@linux.ibm.com>, Jeremi Piotrowski
	<jpiotrowski@linux.microsoft.com>, Claudio Siqueira de Carvalho
	<cclaudio@ibm.com>, =?iso-8859-1?Q?R=F6del=2C_J=F6rg?= <jroedel@suse.com>,
	"Lange, Jon" <jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>,
	"Johnson, Simon P" <simon.p.johnson@intel.com>, "Nakajima, Jun"
	<jun.nakajima@intel.com>, "Perez, Ronald" <ronald.perez@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: RE: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Topic: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Index: AQHazb9RgtF5ECaWSE2iVvmX08EwbLITKjDwgAEez4CAAKutAIAABwuAgAOj6gCAAFszgIABHNoAgACFmQCAARPigIANxgSQ
Date: Fri, 16 Aug 2024 03:09:08 +0000
Message-ID: <MW4PR11MB5872C81013C01990586E3F138C812@MW4PR11MB5872.namprd11.prod.outlook.com>
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
	 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
	 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
	 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
	 <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
	 <MW4PR11MB5872A33D7ACFDDB34EEDC6958CDE2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58721C73775C3AD60D8C50338CB22@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <a5911223c2e23283674de4b85395acf0326363b2.camel@HansenPartnership.com>
	 <CAAH4kHbiDaZjae21b2XPpWyPehBhGghshqz0jYf29G2p_vGKVQ@mail.gmail.com>
	 <f809dfb51e14d93ec5538fba31d3d1478d69484c.camel@HansenPartnership.com>
	 <DM8PR11MB575078E846B4E1E70D6A317AE7BE2@DM8PR11MB5750.namprd11.prod.outlook.com>
	 <ab64151d817e32ae440668ad8fc7b42eddc59d07.camel@HansenPartnership.com>
	 <DM8PR11MB5750563E06F6E7C278667768E7BF2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <afd3bf54fd77a1d6922192e1865c5cefadff7d92.camel@HansenPartnership.com>
 <DM8PR11MB5750FE8336C6DC96B02550DBE7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5750FE8336C6DC96B02550DBE7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_|LV2PR11MB6069:EE_
x-ms-office365-filtering-correlation-id: b69b4957-904e-4bda-25cc-08dcbda0cb66
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?n/J8JHZI3EP6Pd32kMHn3eRy5kkSnBfxee3x9seGLHDY9t+7YgISslvW/z?=
 =?iso-8859-1?Q?XU4VOs01wdk3/5f25J/rANVjEBslnUaPDILUHT/DsPAUbcLsmkQkgjtITv?=
 =?iso-8859-1?Q?GCNGFRTHehCk5jMUZO6m9xu1fBsN8FqlT3sfubCYSwfjYGY/7KEi/JQBKd?=
 =?iso-8859-1?Q?tBZce5PLYFJzleJj4d0KDPZGiyfDf37G5+EkAopPt0437qeYstrFLQ+BNc?=
 =?iso-8859-1?Q?bQw0aVsIwlNlgT3Saw2HllBEY/B5+7f7OXtA411gbuc4kpYh4e3wuUTlae?=
 =?iso-8859-1?Q?dQCnSiW+kI9x9hg5/mXuQTbzQ65n3vnehTcZfNWDKkbOlVVtSAGecng4By?=
 =?iso-8859-1?Q?DXLXWmiaGZBnxaHIuknzFaB38P+712VYs9Z5rRM9vrhH7fOt+eugjBene3?=
 =?iso-8859-1?Q?RbG5qQkBgC0JdXOkvWkrrxOlI8zB2tkF/n9K+EbCiKskm/qQ6DsSzNRLmo?=
 =?iso-8859-1?Q?LXot0wuivVULU/xLfb0QRWoOolkS6/vBF+4p7mbWeIwZG7wXpw+3b8WiyV?=
 =?iso-8859-1?Q?Bt2iUnM9yKQE5OLFpex52WQvMCTOGuKytdjtKYlFdQAT58r75iMbY5aHGV?=
 =?iso-8859-1?Q?A6flSdqbABx+5F+TlUo+qfXIj7DSZZx8O7LPVklqxnJ/bqT5SAOosM2SMN?=
 =?iso-8859-1?Q?lOeVquzryGxISXlc2fWA5IYtD+72XTUO8MFXpJXwZBj0cM/DgiPKju7eZ4?=
 =?iso-8859-1?Q?8nfYrLZaUJLiWQUm4WQOXI4Dp40tk4Jp/uu0G1dQseJVkCX+E28Euwg4gH?=
 =?iso-8859-1?Q?ziehHJbsNxDqY3vAn1jI8sYeU/wgzJdZsbxWNR5aM849hJBIYgRrDEbyOU?=
 =?iso-8859-1?Q?CPtczbL1pa9lllWGxi8Y4nYbjPBEP3FZsY6Jgd8ft90A7R8Yv9u0JvB36y?=
 =?iso-8859-1?Q?o4Bz9H7hkiPDKHj7P/oj9G8ea9sjKAi55UG7Etypyq+f6QsTaLGC0ql0z3?=
 =?iso-8859-1?Q?A9Fgkdc8qilyFRMvcbi5q8UEKTKBgROTbcWoLUjRVh/uS0BHov51fGJ14e?=
 =?iso-8859-1?Q?u9EFD/mandP4vwAOEH2qqq3uyx1pbO0YupFNENhqdwaQhejW83QbbhR405?=
 =?iso-8859-1?Q?/0R0jV+kspPCe84+WSv6dIqIWQjU9GRqPH5zPX8Y36e9KotPt8hHjJEbVx?=
 =?iso-8859-1?Q?5m+1Hcef/1lHhrrr8QAd5KBuxVP24OCVBvvBFwjnclcqW5ai3kw7triksN?=
 =?iso-8859-1?Q?xd82F5EuJ7MjtB5SFyCd67u94UZ3sJGH465nbxv0qk3oPx2SHRhnv/fbZU?=
 =?iso-8859-1?Q?PellbRNIDbxqBsp8yscDD2ehFxMJuPuzNeqlphUEHNVuT//GjAVY2h8jdV?=
 =?iso-8859-1?Q?5FTLYf7rdhIUIfi7w91DrHryB6jd3EVQCGYuFJNUdvSgVhrVgfkKqk0XF6?=
 =?iso-8859-1?Q?LLnWzdDYNz7YIGqgyO92W7COwNZq0SBlxi5sedwWF3t79R+Lvalgk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5872.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?eqbEGhwN+qjgSsOH21LFTlPmRNnOTvP9EM6viPod/lvfL41e+R5jLogada?=
 =?iso-8859-1?Q?lcXr2mDeWJrFpL25rt3mhTQYpLiWhrM7IbtJ3AdoXzR8OiBY1o85/BGsFd?=
 =?iso-8859-1?Q?H1lvfOM/wgLLQcjfhsYTyF4pgnJfxqHHeunoUVxIJQDVogvOS9P6ZhCmZT?=
 =?iso-8859-1?Q?GWSrgixe7SNpgyS9Znd6CeCnjwTnRxrJxfxhUcGMZljfH2N6NGSel7Mltx?=
 =?iso-8859-1?Q?37pDuqGDr3lWOkoPaWkod4lBasQFyZUz2duSRzClBhy4LRL9UVqdqjGxZW?=
 =?iso-8859-1?Q?QAKYykBSO8GnX4Fvave6tJU+/kgR4hDA2I6SEgVnGokb32vfYJPMSFM5Zm?=
 =?iso-8859-1?Q?lO1U/Er0XoY1iMUQ2UMXN3739SzhV4gjlSOflWsrbjr9PfjSkyPcs9RObZ?=
 =?iso-8859-1?Q?EFD7Mu5mmhNl+qC3aJB5JXdxTHQfMZov23Ef7/B9bLVTDinjEhGeWjt4qU?=
 =?iso-8859-1?Q?AdQ7C5VukOZlBa6qsTyfXFOd/cNw0YK3SD2c4xqybdcC2dYf6nCPTs28p1?=
 =?iso-8859-1?Q?+vpBGjFEDlaW9wSSVFgnKVTME3LNLFvwm+Ggh7Q84CcqXiLG49Ct0DecvY?=
 =?iso-8859-1?Q?Xh+elHrn0JcgUga9zzM3i27hbRBR7Q8eUJ7Hkttvh8x2mV94olJJ/J9h5E?=
 =?iso-8859-1?Q?oeurJOb30GIna24Hp+vNuHZFHZa3a4b5KVPk1a6mOZbbhTSA7WnKeapUEK?=
 =?iso-8859-1?Q?ErTMjx8LrdhELO99qqYnNuirodaHzhIBXbDWsPdsWaV18qd0e6g+9J9+MV?=
 =?iso-8859-1?Q?UEsTZDn0VfNtIGQxBBQ799W0ndiKKdlXRN3l4IEzMWiui8S//AooHbzzWR?=
 =?iso-8859-1?Q?Y1VvVdE42PVoZv9fInbkUGGKJMQg9uDkvDUSVXAHboG5L4i+fhZW8P1Rt2?=
 =?iso-8859-1?Q?9hBFZ22oa4QPosBKLEZV/XtHGE51Q7+S7WHj1z4QIU1VAJsg2uDspiBrqz?=
 =?iso-8859-1?Q?I6e2QlEF7QpUEw1pJw6lqsUC5ueA/bXu4iqkFcQraJbt2LE0LRG/4SKZha?=
 =?iso-8859-1?Q?SjEGPUKB55ip6DfxI71r+OiaJuv1qeJ/GK+niBERm1idSSkXl8pSBQpm5f?=
 =?iso-8859-1?Q?ssy6gF6BKkNmmyQAXLypLoSfLpVPBiwzcu/6xIJZV7uH8sBhmOzxxCl+L8?=
 =?iso-8859-1?Q?yioFmt1yBy0IFUVEwor89Fr1XbksZKnGOKDIvkSsPuBkI6DKBdy3wqUAOr?=
 =?iso-8859-1?Q?F0i03RFvS2EVHohLF9REYFPINVNAsslL/0RetMxC1s2Brgh984RpvUsYF1?=
 =?iso-8859-1?Q?f1qqkEb8plDixhYgq9HDADOcpfdOTxVQcl1x47wEyBqFz/GRi+tqK4d1TF?=
 =?iso-8859-1?Q?vANGT7JhLj66GtpMkWIXptFfnJ2s3EXzU6sehxPtUl+YVQC+TVMjPdvu82?=
 =?iso-8859-1?Q?1MtwRN2virw91VtV6FJdhPFccG3QTR3f8hUqR5wUToiHBZzmCJW844BPdB?=
 =?iso-8859-1?Q?6uHGG2dhaQVjvMhZ4/mFVWH6DdFBb53cTOYS9ZdJXB1nNStiaahSt79L0e?=
 =?iso-8859-1?Q?g+Pzd7KwiQuTmxW/xGM0gZ1sqA7+rN9QtHdPcRmNEQ/I2Gj2T0+IiGFRz/?=
 =?iso-8859-1?Q?TWr7Prh7qYM5rh2bnVppMN2eXxTL9cibx71cM4vTwSosCDktfI5HT/3mcR?=
 =?iso-8859-1?Q?DigfFpexPm4zD6JjJuNXhTTwPKyibpxlBW?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5872.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69b4957-904e-4bda-25cc-08dcbda0cb66
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 03:09:08.4474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xSAMCEopxAWX1aGBNqbbl4o6S3ac387oN1G9R/Ipe8qLzbSFNFFoedbJYRXfO6DNIVNtaPEmmh9BmsuGSVMOaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6069
X-OriginatorOrg: intel.com

Hi
I am back from vocation and trying to answer rest of questions.

For CRB emulation, right, it is not present today.
We added https://github.com/intel-staging/td-partitioning-svsm/blob/svsm-td=
p-vtpm/kernel/src/vtpm/ptp/crb.rs.

Thank you
Yao, Jiewen

> -----Original Message-----
> From: Reshetova, Elena <elena.reshetova@intel.com>
> Sent: Wednesday, August 7, 2024 4:47 PM
> To: James Bottomley <James.Bottomley@HansenPartnership.com>; Dionna
> Amalie Glaze <dionnaglaze@google.com>
> Cc: Yao, Jiewen <jiewen.yao@intel.com>; jejb@linux.ibm.com; Jeremi Piotro=
wski
> <jpiotrowski@linux.microsoft.com>; Claudio Siqueira de Carvalho
> <cclaudio@ibm.com>; R=F6del, J=F6rg <jroedel@suse.com>; Lange, Jon
> <jlange@microsoft.com>; Dong, Eddie <eddie.dong@intel.com>; Johnson, Simo=
n
> P <simon.p.johnson@intel.com>; Nakajima, Jun <jun.nakajima@intel.com>;
> Perez, Ronald <ronald.perez@intel.com>; linux-coco@lists.linux.dev
> Subject: RE: Coconut-SVSM - vTPM support for Intel TD Partitioning
>=20
> > On Tue, 2024-08-06 at 08:21 +0000, Reshetova, Elena wrote:
> > > > On Mon, 2024-08-05 at 09:55 +0000, Reshetova, Elena wrote:
> > > > > > On Fri, 2024-08-02 at 18:54 -0700, Dionna Amalie Glaze wrote:
> > > > [...]
> > > > > >
> > > > > > That brings me to a curious point: is the Intel TDX SVSM going
> > > > > > to follow the SVSM protocol interface?=A0 because if it is, it
> > > > > > will naturally inherit the enlightened interface (the code will
> > > > > > be present in the kernel, so it only needs activating).
> > > > > > However, if the Intel SVSM were going to ignore the SVSM
> > > > > > protocol spec then it would have to reinvent everything and the
> > > > > > CRB interface might make more sense.
> > > > >
> > > > > I cannot speak on behalf of the Intel TDX *SVSM* implementation,
> > > > > but for the Linux guest kernel there is no intention at the
> > > > > moment to support smth like SVSM protocol interface. We have made
> > > > > an evaluation on this during the spring. There are no usecases
> > > > > currently that require such new protocol introduction on Intel
> > > > > TDX and it does bring additional code complexity, etc.
> > > > > If anyone believes otherwise, please let me know.
> > > >
> > > > If you reinvent the vTPM communication interface, I can see you are
> > > > able to get away without that SVSM communication component.
> > >
> > > The goal is exactly the opposite, i.e. don't reinvent anything, but
> > > try to stick with exiting ways on how we have been doing things so
> > > far in Linux. In this light SVSM is an invention to do things.
> >
> > You want the SVSM vTPM service for its tight binding to the guest VM, I
> > believe ... and you want to add a CRB emulation to the SVSM that
> > currently doesn't exist.
> >
>=20
> I will leave it to Jiewen to comment on the vTPM case, he is more
> knowledgeable on the details here.
>=20
> > > =A0I assume you've done the same for other SVSM provided services lik=
e
> > > > deposit/remove memory and vcpu create/delete, but what about
> > > > migration when it comes along?
> > >
> > > Could you please give an example of where let's say we are not ok
> > > with existing Linux ways of depositing/removing memory?
> >
> > OK, I looked but couldn't find it: how do you current add and remove
> > memory from the SVSM if you don't communicate with it?
>=20
> I think we would need to define the usecase precisely first to avoid
> confusion. I guess you are talking about VM guest (L2 guest in
> TDX terminology) OS possibility to add/remove memory in runtime,
> aka memory hotplug, correct? We have started to look into this
> recently and Linux supports this capability via different paths,
> including ACPI hotplug and virtio-mem. So, the goal to enable mem
> hotplug would be to make sure that relevant code paths are
> working for both 1) normal TDX Linux guest (running in L1 with
> no SVSM) as well for L2 guest running under SVSM,
> ideally using the same code in Linux guest. And this is where our
> difference in architecture comes from: we can
> use the same code in both L1 and L2 to do this, instead of having
> the code of style:
>=20
> if (running in L1)
>    do foo;
> else
>    do bar;
>=20
> So we can issue a single paravirt call from both L1 and L2 to do required
> things, i.e. memory acceptance (TDG.MEM.PAGE.ACCEPT in TDX terms), etc.
> In case the call is issued by L2 (as any TDG.*call by L2), it will genera=
te by
> default (this can be configured by L1) an L2 -> L1 exit (host/L0 is not i=
nvolved,
> exit is pretty cheap since we stay in secure context), L1 can inspect the=
 args
> and decide to emulate/drop/reject/do whatever it needs with this.
>=20
>=20
> >
> > >  Why do we need to create a new protocol like SVSM from guest kernel
> > > for doing this? It can be done if there is a valid usecase of course.
> > > All I am saying is that we haven't found any yet.
> >
> > Even in your model the SVSM performs services on behalf of the guest. I
> > think you mostly use traps and emulation instead of communication along
> > enlightened interfaces to get the SVSM to perform the services but one
> > of the historical lessons of virtualization has been that paravirt
> > enlightenments are useful in places (most particularly drivers).
>=20
> Yes, paravirt englightments are important and no one challenges this fact=
.
> When we run Linux as normal TDX guest (without SVSM) it is already
> enlightened and using our TDG.* paravirt interface to do many things.
> The core idea here is to use the *same* paravirt interface also when runn=
ing in
> L2 under SVSM vs. doing one more enligthment for L2 case *specifically*.
> And again, I repeat, if we see usecases that require this L2 specific eng=
ligthment,
> then this approach can be reconsidered. At that moment we will have
> smth concrete to go to x86 maintainers and say that we have a valid reaso=
n
> to start adding additional complexity into our tdx or core x86 specific c=
ode.
> We dont have any concrete usecases to justify this complexity at the mome=
nt
> on TDX.
>=20
> All the above is of course only given the fact that we want to support bo=
th:
> Linux running in L1 (with no SVSM) and Linux in L2 with SVSM. It is an in=
teresting
> discussion question for the community what setup (or both) makes sense in=
 the
> long run.
> So far, we are making sure we support both.
>=20
> Best Regards,
> Elena.
>=20
> >
> > Regards,
> >
> > James
> >
> >
> > > =A0Since the high level operations will be pretty
> > > > much identical on AMD and Intel it would be very annoying to have
> > > > to do it in completely different ways (with presumably different
> > > > tools).
> > >
> > > Migration is a separate story, which i dont think has any conclusion
> > > yet or agreement in the community. We (Intel TDX) have a way to
> > > migrate the guest without the guest assistance, so we dont have a
> > > strict requirement to migrate out of SVSM. It remains to be seen what
> > > method(s) is to be selected at the end. And if svsm-based migration
> > > method is going to be supported for intel tdx, then it needs a
> > > separate analysis to determine what is the actual required
> > > communication between the L2 guest and SVSM in our case and whenever
> > > the usage of the SVSM-style protocol is necessary.
> > >
> > > Imo migration is one of the topics that would be great to discuss at
> > > LPC.
> > >
> > > Best Regards,
> > > Elena.
> > >
> > > >
> > > > Regards,
> > > >
> > > > James
> > >
> >

