Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BFD1877
	for <linux-coco@lists.linux.dev>; Fri, 16 Aug 2024 03:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723778851; cv=fail; b=ZWlPumiLY25MUNJX10uFUT+bqf5Jo/bulccMX7NbjBVL4rmhxgldztpjDhgoucBrHEckf/227iMrTWhpq5RZsAuZUvWkGoPJlvWyYIfONguRNBBrQZRsdNrXkGO7E32tYs3kFNg2aPdr5X9LozdabMAAYmC865/brjtUFqtcnw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723778851; c=relaxed/simple;
	bh=AVXZ7336X6lBcffRIcHLW/cWbpxj8JUJqmINeTCpCNc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q/f3PZ39PLKZUdA1xQ3kJauB7iWhg1NAW2klcCBW00cn7cTkOO96l0i5PZ9Zz3h8bpiy+6kwlSxGpS3tXIaw0PNJ8A1UPDY5ZEuL3HGFk8EdeXTWgaZUf1WS2B8LbJFz5V/Eqq6cqVumuSUl6pcB0uDhreMUZszRO9qMJdK8lMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DYJ/PJ5r; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYJ/PJ5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723778849; x=1755314849;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AVXZ7336X6lBcffRIcHLW/cWbpxj8JUJqmINeTCpCNc=;
  b=DYJ/PJ5rzIGodT+Ho6B6CzFzjlGI//uwuHjwlfJfyWkH2n63RY+zFi3x
   hp+j0w0ZTxRxCjr8htbsjzOcT2pwDatNNPQhqpa0/WcEGpAQ0+N/nu6M5
   yNhSURHc39H8nEIFiUeYiIcH1uq+aVYo/Ws3JDcq5aMZX0KMOtacYx9xV
   2qbAQtXeYdzhPvDjcZRJBoZufsf71cwuqXGpclyEToA9vvnMRUGTzzFcU
   C3im5hxZ7qh3YJ6myuzB8TOg2C2XeFJaM0YUYg8j3lUDTUp96FY71+Uyk
   tzS7tdX3VyGtLR1v130ScM0YJjfUrn8aafta5xO8BkisKQ+1QfydwbN9/
   Q==;
X-CSE-ConnectionGUID: cMfXEpuJT3maL+1eoCEngg==
X-CSE-MsgGUID: /wrCcdHdSKaCsFUgNqJKBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="24968340"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="24968340"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 20:27:26 -0700
X-CSE-ConnectionGUID: BURahyHRSZmGYrZJm5/aWQ==
X-CSE-MsgGUID: Mr8RQ53SRs6b93bbOCSvSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="63958906"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Aug 2024 20:27:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 20:27:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 20:27:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 20:27:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLRZVDWGe7sFr4K6uooyqRlQ/2N3B5QwfMBSUozOchd+a8UaiKGhPyToB8DqTo4PNQiqAk6JByTGIKE8ReDEVEOoax6gh6bfT+idmrt7/WYByVkWmGLfcswsM23S/+ZbsaabKNCDlDokBTJRd4G4blztwhMEKxLXYMwfpmneboeyvsSttvZQqPZtosQFNoQFqGRDmT8+zb1Ufz255Rvxus58h4FguR4TaXnnhIAA7UuT9MsOh6Gd6ssnQDAZNQWezXXwVY0jQfLeSS1h+yYvo+bDBfcCQC8xWVyu296vI+H/2zMnswFNS5v7ON+8nXKEYG1MdyO8jSz8tLdBy/w3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVXZ7336X6lBcffRIcHLW/cWbpxj8JUJqmINeTCpCNc=;
 b=UbMM2vi1tWQZzu3V22Wf+B06kyoxi2it8No3TLJAuk30yHQ7dMDhHhrL3NUPjpnc06pyU8PfiPjngs5ZcwNuBN/7He1dd9ypsMcQKQYqgaqVOvEuVWt8aejaBKio/PnwgUeLcWwVUkdDHd/oG5BVVoUQ/zXslqT3/6NsIgAYzMx3E3p3yvQEsIyNqCznJJBo4Wm/pVIae0TCWXX9bqtFkiGYnpGLNrU+GYQ1Y/q8DtBTwLhdtHW6AOIfNT7rvdLr3rxbHqabgLziWQY3uAPVhzbasuOOE7/9QMWuKSyXsnbXSbqBDC4+zaFwK8HdMF6cc0T/fSSLgfBu7f9mpNVKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 by SJ2PR11MB7546.namprd11.prod.outlook.com (2603:10b6:a03:4cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 03:27:19 +0000
Received: from MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2]) by MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2%7]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 03:27:19 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>, Jeremi Piotrowski
	<jpiotrowski@linux.microsoft.com>, Claudio Siqueira de Carvalho
	<cclaudio@ibm.com>, =?iso-8859-1?Q?R=F6del=2C_J=F6rg?= <jroedel@suse.com>
CC: "Lange, Jon" <jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>,
	"Johnson, Simon P" <simon.p.johnson@intel.com>, "Reshetova, Elena"
	<elena.reshetova@intel.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
	"Perez, Ronald" <ronald.perez@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: RE: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Topic: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Index: AQHazb9RgtF5ECaWSE2iVvmX08EwbLITKjDwgAEez4CAFTNRIA==
Date: Fri, 16 Aug 2024 03:27:19 +0000
Message-ID: <MW4PR11MB58722809448BDC3F574627A48C812@MW4PR11MB5872.namprd11.prod.outlook.com>
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
In-Reply-To: <a5911223c2e23283674de4b85395acf0326363b2.camel@HansenPartnership.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_|SJ2PR11MB7546:EE_
x-ms-office365-filtering-correlation-id: 7f225d3f-aa96-4dac-7f01-08dcbda355e1
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?z/zGoVeQc/WS+dBZEMZO5RXCbUzmQA+k6+hAhI0b8CNwwDfJbRD/fbuRgj?=
 =?iso-8859-1?Q?4GB2wSq+fFV8PlIOq1YpfyxWDBqir4mRFLfNHcaf1eFExKJDy7Pt5bFo20?=
 =?iso-8859-1?Q?UHYHfF/VMZ4QoAMLgZxlTmbYaoaCn1Dg9LG4QZR7n8sHvX6KTzQVNy+/2g?=
 =?iso-8859-1?Q?sHNsbSCR7jXxvqXH7zaU6CijglZUk/2rGNEDa71nPKXNyFd/rpbGngXcSg?=
 =?iso-8859-1?Q?THcy4jW7qL0jUCp3ZVsCFi4Ew/DmS1X361CE+A/PU/iTLwGgUbzE9x0Wqh?=
 =?iso-8859-1?Q?qprAPc7O6Jy9TA9jcz9JNDTB5uqTfrNl6tGrIhAAi0l2g0u4HM/JTXQAC/?=
 =?iso-8859-1?Q?9pwfQTkbu432aRdbPDEWuD6jyLXLvYD0f1Kgzo4wwj6xaZx+tcIQ7HIIfA?=
 =?iso-8859-1?Q?IS40N2jaRz3IVGc1zYnPxualmcXttVykT870T20aYS5gPnQgWtyDa1Qolc?=
 =?iso-8859-1?Q?oYicY+w5jpcCBUEm4ffs/1ggDLODxxxl5b14/79z4bYl9QcXrDWbF011Y1?=
 =?iso-8859-1?Q?3TtDpiPjdbdIyOmibX/SgrMih8KbVfQIFS8DiSmP4L6ufMn3AqNy8jzXQO?=
 =?iso-8859-1?Q?8U4JlvAJMSuFRXAr6vr6kP2E3yKs3wywgklWbb0kAHrTXJ/to3DccynI53?=
 =?iso-8859-1?Q?FBEU1obz0Dwtr4Bt0/xy1TtYI0nsPwxNKUiuwtiu6MbT2wmYP7/dIKnMuf?=
 =?iso-8859-1?Q?ZXOCdbsqliTsCqRJi9L8tADeQLQjmf771x61HfHjS0vS5v/GidF2AYCbA8?=
 =?iso-8859-1?Q?9UxWfcb+X8UPuS1Er8ByA95IPLyG9JYMMIEhlOY/LB4OQaVLib9/I4Z40a?=
 =?iso-8859-1?Q?EeMKcPFJb/tE46g8A29kMgJKGbgxr8pGFivl11cr75jr9YyfuSpf+MtoW8?=
 =?iso-8859-1?Q?gzv32PkJA1uuWy4EPiEPKNpJqoR9zlKTxSJlrCZbTgaqYLGNjKhxWHdNrc?=
 =?iso-8859-1?Q?Y+CfzyjbqQZBheLat1FC4NpIUFGzDCFHpX0LWBMOFuo/Z6/dXRfNbmEesv?=
 =?iso-8859-1?Q?2QvRCCXyIhkGU+CCjZxjgC3xR+rT5hOpIdSW/KaQRlfuqnpoZOKoDoCf6V?=
 =?iso-8859-1?Q?Ti//nPpbU0Bqq5bNFxOlHyAGAWVMqwFquAlaD2SycYS4vU8wT2xGN4pYqc?=
 =?iso-8859-1?Q?dcQcvdNVBREf5DeL64ejSJ8hSnGH0nLcKdjGVaYtgGnk6S3y7GHpBiM2/7?=
 =?iso-8859-1?Q?oud6ypQ+8/lHmJ8fGLt5mYPw/zMwODeF/7zyd+k2fKczftZTLzeQtZaunQ?=
 =?iso-8859-1?Q?rpvKcrb3HNjS1/CAuk1U6hfawfKoiPhG9lQas2Cp1ifDLssYIMEUi3h9RR?=
 =?iso-8859-1?Q?MM4y9p7V/02E4AFYCKOEKZwD1KIuOATSjk+SmOx8zp5MdDYsukJDrifVSg?=
 =?iso-8859-1?Q?Sa005P9KC0nS76o3XnT+xTSe4XMjTr4dYcfo03To687JwCCkZPHDw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5872.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KkkvMuXxVi0mGoAapFjkDtrX3BU4Ubg68MAvpMijDrq+SM7H18gwY3ynvj?=
 =?iso-8859-1?Q?gdM5sjlrJlxsLiI+WJ99M91nCXrf5mJ+Nxbq21nBAS3oi70PBZkWrdTQ1Y?=
 =?iso-8859-1?Q?JLAsfyFIaco6ma/8NVcDrruT9o8tquFeK2u8tgRQE63jl8CYoayPNI6bAi?=
 =?iso-8859-1?Q?jawQpJiHA1FsoHT3txPUIgBlcGyr1O/wtPDe3yLajMob6CededMlNhewJI?=
 =?iso-8859-1?Q?dW7Kt+i9o8dRAl5e8Z433Ikbn63bswv73B7PUM+nlw47NNsDM4N6dbG/8F?=
 =?iso-8859-1?Q?AYicK9Sk5sBilmFgfxva5kP/VZsH6Wi53Lfv7tgfLYZ3DXZ7g/DkxluR9n?=
 =?iso-8859-1?Q?pEAHBzk34QpOwlb1JI+NxM91a93toH4nXNJ1hRo6Ad0cMJi4xo9lTHoq52?=
 =?iso-8859-1?Q?oTP5Ss4eFUHdBeuLz7sJ+P6AN81RTFfFXq5BAsr+F5zBuUp4yKk1CpATQl?=
 =?iso-8859-1?Q?817a/YOujkhXgxwWPMjbitz6/UFVhOTYsUaupijYn29Q0OvukzpFY0u5QA?=
 =?iso-8859-1?Q?o5553bTGO/anvo41ORduOY++lBytlC2JfzBd3EHLHM0LtizmsEqofj29UN?=
 =?iso-8859-1?Q?F2h9yBleF/h8J2WjXxA3+1ewlJrUEaU/4Z2cRpHDAnJhECsom3kqnqB2o2?=
 =?iso-8859-1?Q?taXWUKatEHHDU71E4DHCBUVOZ/6QlLdvS2pWLnMR9t9nlJaG0iO60soT9H?=
 =?iso-8859-1?Q?EKy/v37xtjz1NizrXD1ff8F9v/MvRV6DzfZYhscggFR8W//6fQ6FV+nOXV?=
 =?iso-8859-1?Q?9DpMrcXR1iCRGJwe4IksUdmJE647vv6a8RhmGYATSy81lWVVZWp/9ewSBz?=
 =?iso-8859-1?Q?N30i5yJFQ6fU1OGJj2SOLKTqPOTj8GNVPPqQhduhtwb0czjPt50eOQvmVt?=
 =?iso-8859-1?Q?+OBY5Kk5glRUKX6CfLmWvr+7W36b7FAlihsGqc/2LhM4MfAH8TXmNWa9o9?=
 =?iso-8859-1?Q?UUzYs4hTFG5qQbAyVEvFB6hYS8KXVZrXZH8Lve2TRE8cG6pMPIw83I/Geb?=
 =?iso-8859-1?Q?cBeA3Zxepr+DWJ9jh477II3qclE6CInCfWtFtXtjZFNqvB+OlMsY8ZzMLD?=
 =?iso-8859-1?Q?PrakkAeLX9jxo5bGaVBCXgE0rG7EXoxmekrOu++6wcvXVZs+6I4nWqjQ5N?=
 =?iso-8859-1?Q?0z349rLIQ0Ia7e3thAB8RSWRGPm0dPQhKVei4LIzz0iiWNrZLW+WTdXjQC?=
 =?iso-8859-1?Q?kiW7u3blQpEl1+Z+Dg4lHjzasyndEeECyWYvk0S7wgvKzobuF9t2RQ6zSF?=
 =?iso-8859-1?Q?p2pHEddrYVvEjIHHCzvKr4HJXR1DtwO6QuBa79K7KRUOLCSwLC1zFXzSVa?=
 =?iso-8859-1?Q?TKsD6S9fxQS8n5SHM+jL/B2nRC3+HvmKTQ1/Y2Vhue/iLlt4EFXqV4U/B+?=
 =?iso-8859-1?Q?VNWTr8EYeBS1QENAhT3Om4hKPdYcuwzPlN1IRXwdYmlLZ1+IdjIH+6Wk01?=
 =?iso-8859-1?Q?4CGN51iOdC6VwruMsrx7urEHyT16vaCerNv7teDF9D+NG1eTafdQm80OqJ?=
 =?iso-8859-1?Q?PndnOpFItBGcY9vMMnciWkbUlUfe9Eczq9UEBJIYTyR2kB4hq4Deo7QnB1?=
 =?iso-8859-1?Q?j+els92e+T5ziI63yi2wMR4ZypDW0Z6ZKYyiZPx84fIhrA4YpkuRoI65HS?=
 =?iso-8859-1?Q?kK21NrEvK0CQKBS2loASTu6DHMl02Z1nLJ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f225d3f-aa96-4dac-7f01-08dcbda355e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 03:27:19.7778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9x82L2IXuD0us/vbkhwe5uyhE7oq8HrtsYJLChtjq+sSuDUiV1vxog9M2ZDrWvMTfTL0o3gut9xS7UPnTJhREA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7546
X-OriginatorOrg: intel.com

Thank you very much to let us know.

Currently, we are trying to reuse what coconut-svsm does as much as possibl=
e, and only change when it is necessary.

I agree that this should be done before final production phase.
I filed an issue https://github.com/coconut-svsm/svsm/issues/440, to track =
this migration task.


Thank you
Yao, Jiewen

> -----Original Message-----
> From: James Bottomley <James.Bottomley@HansenPartnership.com>
> Sent: Friday, August 2, 2024 11:40 PM
> To: Yao, Jiewen <jiewen.yao@intel.com>; jejb@linux.ibm.com; Jeremi Piotro=
wski
> <jpiotrowski@linux.microsoft.com>; Claudio Siqueira de Carvalho
> <cclaudio@ibm.com>; R=F6del, J=F6rg <jroedel@suse.com>
> Cc: Lange, Jon <jlange@microsoft.com>; Dong, Eddie <eddie.dong@intel.com>=
;
> Johnson, Simon P <simon.p.johnson@intel.com>; Reshetova, Elena
> <elena.reshetova@intel.com>; Nakajima, Jun <jun.nakajima@intel.com>; Pere=
z,
> Ronald <ronald.perez@intel.com>; linux-coco@lists.linux.dev
> Subject: Re: Coconut-SVSM - vTPM support for Intel TD Partitioning
>=20
> On Thu, 2024-08-01 at 22:38 +0000, Yao, Jiewen wrote:
> > Hi
> > As follow up, we have drafted the vTPM document and put to
> > https://github.com/intel-staging/td-partitioning-svsm/blob/svsm-tdp-
> vtpm/Documentation/TD%20Partitioning%20based%20virtual%20TPM%20Desig
> n%20Guide%20Rev%200.5.1.pdf
> > .
>=20
> Just a note for the vTPM reference implementation which, I think,
> applies to both you and the current SVSM-vTPM: the reference TPM
> implementation has moved to
>=20
> https://github.com/TrustedComputingGroup/TPM
>=20
> And the one you list (https://github.com/microsoft/ms-tpm-20-ref) is
> now a stale copy that isn't being kept up to date.
>=20
> Regards,
>=20
> James

