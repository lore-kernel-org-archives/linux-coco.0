Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320C81C68D
	for <linux-coco@lists.linux.dev>; Thu,  4 Jul 2024 03:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720062461; cv=fail; b=ItCLNGIlmDjA6WwtELtxyr8FNzNjHy245LzGJDcigUxHXVo8KYEBW6Kw3Ugak/ms/jVAq7jC0pqjJSKmgpkh0tFHCgP1FNn5MfabNCdSCxVbBszayieJ/yKEr2zUqIqbxVkXlUBsoufLqs4e6/2a+gQ0xYsCNWyTx1C9CnkdLF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720062461; c=relaxed/simple;
	bh=zZL2LHfE4vteLC39PV7OzhWCxLSWu3/hJTuC8MzDlMQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jBIMggbi76hltFlPf1EswRD1AsuOJM7+t+2rHf1JMnwQYx7l3X1tY9kLxRaWQwq0t9dcrg6pbeWR0jV3Cpm+BCTIws2GuxTEXUHxzjQvUJ7zSl7DZ1QALWAMxvYo7z/oQ67dTVf2XTjng1ETkFEkJogvRExhA6MYgu029mcCg/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cL/nmlmj; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cL/nmlmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720062460; x=1751598460;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zZL2LHfE4vteLC39PV7OzhWCxLSWu3/hJTuC8MzDlMQ=;
  b=cL/nmlmjifA5uE9Dy2sSaWmY9bICx3LTD1ns6xrrQaXkRwvN6+MYC/50
   +DLkkB1M/n4RvCOXE1B9yvXPt8JPsCWYtlezDuNZYo8fxdIZeybN+yXA2
   GoNnHZBhTZqBjFpA9UNVaEsiZJx1qljKhj2WrgPUh9uk6dCJpys4kpCWn
   W7fku0LsFJVZePu0n2ljNt1KKXECiyUtZgDEIG3hPA4DfsKNndlQAY3Eg
   PUwUCKObRwiavhJsMVx3USwNAzMIE4417lVXejboDFXNcx2GzsLL/RFM9
   tz9qaO1UvhrpY7G6f6WQxAxOxpBROQifGkFRrQtsl2h7H/oJ0loS3xQgo
   Q==;
X-CSE-ConnectionGUID: g3E4d/ObRFuQLgMNCzbE+Q==
X-CSE-MsgGUID: CynVJUr6QEq+DH2ojTwDsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="21084234"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="21084234"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 20:07:39 -0700
X-CSE-ConnectionGUID: X0Zwn5aFRqylLWDZuN7K7Q==
X-CSE-MsgGUID: i/BvEkRNSDCmfvZ3uDq/5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="50901250"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jul 2024 20:07:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 20:07:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 20:07:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 20:07:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKW69f5T8K8hqDD+UCQhBmuWn2dvJoNRrkNsuiX9IjaD6unfDBEOTePrD0b9Ghq6eBP1RuvRB3+eFnkERMBIjJJTTb1Bjn4KuFkHCFqgcOcfb8U7lYlMoZlgA65NELwqNazLq38j0AqWazZlk22hZjsSC9TJinD6XER7WuF+hFaARqrYy+r4O9F0bX5pDXPuvq1QshDJeEcyRmu8autK8qcC/umZ2L6JNecTQHHVLEMT/7v48cs+8pM3n2pH/6BemF4bx6WPflrBPdUyC+jN4GfEVNBdz/rLb9Rfy/LCAJk3EtZ4IpmzC4+tlNtIDer9on4QQp+P7YxA9ZVhcGPWog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZL2LHfE4vteLC39PV7OzhWCxLSWu3/hJTuC8MzDlMQ=;
 b=lHrHvPMMXTiZUtVmiwlKNkvGS2qt2dPjbNWWJONLNBJTCQ9H7caUIpVHvkqL8EmGFURqo0EB1QlDgqVoYGHkr7QSjpoRXe13Nou0CWYnOMxJ9RmDFqwTrBIoTh87HRaM7wT8qdaulZvUhq3sHEagXJdRREjoS6qq/HIQF8F0sXc1VOWqG0vRIl0V9p0eoJtky0lDm6go2gJQwsFmjOzGIs9DmihZSGlR7aXrSTAyYfEGTnbdSLr4T9JGSMJLviZfwCx+KOXS7DE8qdXs5qa9Zv45K5C5xZ6aFEfUEhjtSyYPIEUlDsuGSN/HzJJfmtVfewXBzw8AXjFrQ1tC8h+0sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 by MW6PR11MB8310.namprd11.prod.outlook.com (2603:10b6:303:249::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 03:07:35 +0000
Received: from MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2]) by MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2%4]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 03:07:35 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: "jejb@linux.ibm.com" <jejb@linux.ibm.com>, Jeremi Piotrowski
	<jpiotrowski@linux.microsoft.com>, Claudio Siqueira de Carvalho
	<cclaudio@ibm.com>, =?iso-8859-1?Q?R=F6del=2C_J=F6rg?= <jroedel@suse.com>
CC: "Lange, Jon" <jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>,
	"Johnson, Simon P" <simon.p.johnson@intel.com>, "Reshetova, Elena"
	<elena.reshetova@intel.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
	"Perez, Ronald" <ronald.perez@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Topic: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Index: AQHazb9RgtF5ECaWSE2iVvmX08EwbA==
Date: Thu, 4 Jul 2024 03:07:35 +0000
Message-ID: <MW4PR11MB5872A33D7ACFDDB34EEDC6958CDE2@MW4PR11MB5872.namprd11.prod.outlook.com>
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
	 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
	 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
	 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
 <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
In-Reply-To: <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_|MW6PR11MB8310:EE_
x-ms-office365-filtering-correlation-id: cdfa288a-4719-4228-4ccc-08dc9bd67456
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?gZ9vzVSOCDEHu/or3EXW9UpYcIgXUzLvIt46yOvKhFRM6NKwbrFYOgrwHQ?=
 =?iso-8859-1?Q?83WMcwxBiGSbrrUembebVEhbROSUKRlKjWJ1t6S79iI3fGWypW8E85D0dV?=
 =?iso-8859-1?Q?J41zgQHZzzICnHaWKlJhOaTaBwtFViaQHmjU9iKsiarG0WDwx1Jn+5KAaK?=
 =?iso-8859-1?Q?NnuzmPFU3ICydMN2+sGQ1GRPr5mQk9EOI/E8giuiMbzhZU3nGJOeszk35K?=
 =?iso-8859-1?Q?Y56xVx9+53M8yCTIb+m94oEg1aJiZeDa9xKXhoxlpTMuEZ53C9EXr9/6Mq?=
 =?iso-8859-1?Q?pOZLmO32I/3mo8yesj5eBQXK3+rt+/mclcdLSJn86IN5YQOK+svgWKGnIz?=
 =?iso-8859-1?Q?1Gi6XOzVdJkRxp9y3c8EpetvqvW0x6i9YBzIKF0oK20Rui8YVt5+rBQoLl?=
 =?iso-8859-1?Q?WBBWJO9xU3EPZ3zR5yDnKZpQrsoignHNtMXaSNLlb+qCITIh0siKqeNW+t?=
 =?iso-8859-1?Q?nhLoeUXZrTOwHilVE2mDnL3OFMS4Wv+Z/ngDZECuEAuMZ67oskRoQ5cOvu?=
 =?iso-8859-1?Q?BxaOXgRnySPt6rmva7rLI7Cm/1Oc0A9YxGdaqvGh9F2F9Q0lG5DzKvyUdw?=
 =?iso-8859-1?Q?UMBLglPHgiaPNbspmTARufI/5Sz6HGqsuGeBLv8pTLl3OoD7GAIOwQO/ha?=
 =?iso-8859-1?Q?gkusd1U+x0S9KO5E6iO8Z+jD39HOVkaM/et/GwgPpGnzP3LqKdnIkeLAn5?=
 =?iso-8859-1?Q?EK3f3uCn4WkPvLWBZY5DADzwo14f9lsakymXBg8Cj9X1CfJHtjiIPcUB5p?=
 =?iso-8859-1?Q?rBq2jNbyiSNJyomSg4TltJ7ZT7vls+bize4AavSUvC3J5nN/0mqWJyIiLO?=
 =?iso-8859-1?Q?TUg8lf+2El1LptdMMFKTWn77UUbHpUNA5EpjT81IbwwicNcbX+G9dsVaPK?=
 =?iso-8859-1?Q?JdOUWGRB2fKL6rYUoHiIap9/PHNflQy57jIwb8/JMKJpkf6uzV8tf+L7FU?=
 =?iso-8859-1?Q?CjTJt3r7EC51AryzyYaJjHCBBNJ+pM3tRl4OOI/nIwe4U9yB8H1rwFxdoI?=
 =?iso-8859-1?Q?9YjO2JBbSL7nOqtiRnRQqXv6bHKcjooRuReDPtISG5gb4tcA0eRfEyN5IY?=
 =?iso-8859-1?Q?KXbnOlHdXc3s8m4J8JRcKXCCUGiNDqkmiH/z4wB0Rs/2amiI5tQVayLL83?=
 =?iso-8859-1?Q?XQDOHXZwstjkcX9/ZJ9uMZ7l/+CAgwtA0BraH4pIXpkkIdFeGIAKYCU8k3?=
 =?iso-8859-1?Q?2urRV7zvQIAxEf1YqTJF09rAGPyEECZg5g9WIDu61VI5Wbq4Zf3znjwjf9?=
 =?iso-8859-1?Q?eOXyQEZiYXRNyyQPB4SGkaRqJQvJZe8me9fnHtV5FezJi6HRU2y95TJ/k/?=
 =?iso-8859-1?Q?3hVtUaeKh2IVbusQ++cuDhoJgt2ik2C7ElKsg9ot6EZL18tvHLZL0T9Je4?=
 =?iso-8859-1?Q?S0FbAPepGxAa33eAl9j5wnkcgbq1fcbaqFDCZQwFF1DHIY/ODOlU4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5872.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VPSN2QscuD/O5/u+eFXbsgXfo9TAabBT5x3zDcVA6aq1tad6k0Fph71YvG?=
 =?iso-8859-1?Q?AHOZsqtGIDxQiwT5qDiRC5eexf0BizHv5lurmfMtVVH64ZBdhO2He1CDD1?=
 =?iso-8859-1?Q?gkpjvqty2P7yCilW+m245J8eb+xYN98kwgw3A+mQ1jI425j3NRGcXETZcM?=
 =?iso-8859-1?Q?7DxO8BuMdiT5ZayR9ekD5uYOiw+sxN4Mua9ebRx4dIm7vumeRNFvv2PYJC?=
 =?iso-8859-1?Q?WfsQjwnF7OaPq4CqE4Ot4VFw37qCDvLtqot3OFgUi8mc9i6VczVkIwpDW8?=
 =?iso-8859-1?Q?8yP1rIX1aWvdFAhciGYNwSFAdntel0nt5JDw3VqoE+wyfG4WA9+/zkHMqn?=
 =?iso-8859-1?Q?B7LePLozfzbCKa20YuVuC/vEk0ZzWvKeqS3rXa5EIx8uE8v50ZX40BMPUq?=
 =?iso-8859-1?Q?KSRRmGxrGfEeOVQO77CSQIspTHMhN8TnlRCN5eIwAMOOc9KTgKg4Vj/wvx?=
 =?iso-8859-1?Q?vZ1FhdyMD2NkJ3DCW2NgQyC5aRjkWq6s0tPayFgfEBboSputTdamE+4e7e?=
 =?iso-8859-1?Q?oD+F+0txONyUVtw/WyK0xQpR733noq/j7tcQ7mL+/qxadQgQebp9zz0g+A?=
 =?iso-8859-1?Q?wDCgaSfMYqZtU0Qc2H56cYYreB1ByqMEjD8K9HDD9+6gwjiGB9+iTA1fp9?=
 =?iso-8859-1?Q?cdoDyK0qHkbF5lUF8JvdpWhItvmYhOp4gw6nuqygc8mgUzAJYXnuLODA5S?=
 =?iso-8859-1?Q?dqlksKj5clDdZA1bF9nbEMm5JE+t3hoEZIxX7l++YF3Z3UL/9qnntf7dsT?=
 =?iso-8859-1?Q?yZLyUzUv/bqdtOKptQ8IajmmGvkhsdQHLgE239J+AkFJjX1CRRISsKBPQ2?=
 =?iso-8859-1?Q?nyqH0Z06Pq9I7d5bb5fuBMECRHYtaQRxUZCGC3d0RG2zucHdIzPgPVTu1V?=
 =?iso-8859-1?Q?9Kd9plq8CwE1MkC3pmtB09cJurifL3KCVzwu5SwjAPS9W/8o238PPOv+mk?=
 =?iso-8859-1?Q?1sevZyKobpXvuW24PCuOpvB1qoD1DeYnURumOPYCVDw16qC9SBOQzoO2W5?=
 =?iso-8859-1?Q?7Tw2y/5F9bICOyBqQlIPW2X1OcAGbDVMcwWys8tLKGf3GjZkfg+3JGcXHX?=
 =?iso-8859-1?Q?aCBQ2ZLR0Ae1y/eHJKJCBOSAjaQfZBgIKm3pXzkVGPzKH5LCQcu+SqhtsV?=
 =?iso-8859-1?Q?7myj3kunfZoRa18aYh3VS/O7RPsYo5Gc/lg8zyhD/VEpGc134pGgtTTrPs?=
 =?iso-8859-1?Q?MdJhZ45F0oCT63hI6Y8j5e3gJAUtbI1sGX7eapqkpf9nDh/PfHa04NycMK?=
 =?iso-8859-1?Q?VQiDsDWD9SQpxJRpfWk7qCt46EOFrfspzu0F9F3saqgMoRmBV2rFPeJm1Q?=
 =?iso-8859-1?Q?jlpjFIlPfagrxo3AihtEQh/sU0ubhgbN7dDyuwHVU+Aw1JD58/9hiXj4e0?=
 =?iso-8859-1?Q?94LvmHjaZn1EfG7t3cSnKSr8d0Ba4kq1xNB/Z8uqMwhOY5AbhXyGMeq5B7?=
 =?iso-8859-1?Q?G7biVAvuPGcsrHCfrf5sprywzZ+7DZpeTCgYNHmCaMtKqmtG+IBFoyUAlN?=
 =?iso-8859-1?Q?xSUNZVKqBWkYGcahfcwQs4AAYFpOAS7IPRJIR+JUUzbm9OEXltMm1ebm/e?=
 =?iso-8859-1?Q?3GNHwpSen4C67ZA38luGxWnwc7yxKcmTr01eBAqghGqAxF+z1qYWjpk1Yr?=
 =?iso-8859-1?Q?SUKcDwwOcgWEQJAR3fC1XX+EniHF8uChH4?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfa288a-4719-4228-4ccc-08dc9bd67456
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 03:07:35.6525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nSkD7MQpToawfthNfWyn2FNMPj0vpvBsTPvA3KuhsJlz9FKlKAWITiM3lcGDDfumYsi0+ZKSL+8M9N6MhmfYkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8310
X-OriginatorOrg: intel.com

Hi
We posted the initial version of vTPM support for Intel TD Partitioning fea=
ture to https://github.com/intel-staging/td-partitioning-svsm/tree/svsm-tdp=
-vtpm.

Feature includes:
- vTPM CRB MMIO interface
- vTPM CA generation with TDX remote attestation
- vTPM Endorsement Key certificate and CA provision
- TDP L2 guest vTPM detection through TDVMCALL
- SVSM vTPM startup and measurement (SVSM version and TDVF).
- Ephemeral vTPM NVS

This is initial version and we are working on the improvement.
Any feedback is welcome!


At same time, we find a potential issue https://github.com/coconut-svsm/svs=
m/issues/404. If you can take a look and provide your thoughts, that would =
be great.

Thank you
Yao, Jiewen
