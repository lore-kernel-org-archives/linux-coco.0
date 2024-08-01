Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847FF38DD6
	for <linux-coco@lists.linux.dev>; Thu,  1 Aug 2024 22:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722551911; cv=fail; b=stl8iJoUjfGrC8o2MH3auCH0R1e7hwIMewwJ7ERGgKbLUXef+xVkqd6umaM2g2anNCje+g+GP+Xviu6lbSWoP1n2tvlF7b/fG8Pwtxz6+qAWk5NIALW9DJ7LX7yUwtPKJ/l9wYE8a4KtqSWvE8D/M4FOKv6PaX4rJB0t2nT0asc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722551911; c=relaxed/simple;
	bh=lrR26aKiG51vtQkMNYbLkoqk+mG4Y/4p0LLnH4PueVQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lv/afRKzMhd+4b+vHliTqpXFCBzLWkqKl3HvoY8zpPqoZ1GXkV5zUiEAYbdRhjtMdx0nM2DtpLkSuqaeEz3CWZ1exgEGhlZmSAfGQ+RS8Tie/neyxS/r/8jGVSr3qVog4W7Fyk0085RSkH0pK74tObEiB66f91DmYu1yz4pCS/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yq0Uhp2W; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yq0Uhp2W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722551909; x=1754087909;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lrR26aKiG51vtQkMNYbLkoqk+mG4Y/4p0LLnH4PueVQ=;
  b=Yq0Uhp2W7jv3XvHulqUyJB52p3hwmnD+kkbzvEQOm0lWxveeKr0ARRyF
   FHyun5WPgjpOvrqUP7G3E3KYe7tJCnjejtYU5J94MYF0dwLALSlpZadgI
   eQ+a+zSxCHpyNsJgwkdKB3XLTSn3SzupJb8aZHtn39i6WkQ7NMyHLalD4
   C9zkywEW+mjf4Ecia0hsi9lmIv79auzA7x3eEVuV+KKrTmUJJfMvmNFRJ
   haF2kKV/uieM3UGdDGutaYBPsg015h/oqfla1zJYV+HKCbTxchaujs0nR
   2pLhU2YjzchwJ3Ds3piYGkx6a0GFq9aanOHtOFbMDY7aJfIRZ+yxNC4+X
   w==;
X-CSE-ConnectionGUID: 5JK793u+SwGZF2WZa42olg==
X-CSE-MsgGUID: 3OQIFeCpRnqdc7Asoqnk9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="43065997"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="43065997"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 15:38:28 -0700
X-CSE-ConnectionGUID: +3U6cp9FQIiY7XuvlewNJg==
X-CSE-MsgGUID: 8RNyoS/mSA+9Zzs6eiD50Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="55141812"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Aug 2024 15:38:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 15:38:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 15:38:27 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 15:38:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsSr9Eb7pICS6veCRFmiHGHZU5+BiIEz7xQQtGtUPQh6iFj1XScUMhIooMANfYwM3y9uIjAZzTPhqA8Cgv8+Mt5GH3ODZyskGP5O3zDBw5SC7CRgrr+O/a0WOqEEg8TA3RfmIcmKYQ2YQmKsn/JJZtX0JAP16XdbqGABNxfeIfcvSXghQko4tcf0WkIqJWK3eJFUADA/UaIUeVtpP4migBJrJxY6i9+Lw1r6qgB7PtC5vvn1laJVCLHyDtzYBXFp+IaZ5JEofIugQDdsI7dwXcQoaDdCLJiZ671Kuq8F+u+NSKyF2ZV/G6qszyDRiZ+jJJv4JHYYOrltMfgaN17ojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrR26aKiG51vtQkMNYbLkoqk+mG4Y/4p0LLnH4PueVQ=;
 b=mppO6z+Jnw1Dv2zafYuUrhzXKdGtYmRoZWn+a6X/pKmhwL0sSwgYLvjbX4c2MkJKUyOrpLVS9xDexSWewIuEVggAIlajUxGmXThLSkMBGrodho1exWU55vNdyMJYawm8if88THclsIc/r78wU4PABlTaXXGtAvSL4upFnD+AmjBbdLQ4uIWJ8l1ESf5M1dQnI+tHwY2hIAAxkxof5QM8/2lGxnD4aUulK5W3zE1vG+FtnCrekZIRoGeRddMPMq5QxVW01b4MiXvcbKcTXt2zU5H5jtwMDpdFN0rVpC7ejdM4BuYglTqAtLhJ9ulg+BTtjBiyNfqI8cK26JTOn1vWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 by IA1PR11MB6540.namprd11.prod.outlook.com (2603:10b6:208:3a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 22:38:21 +0000
Received: from MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2]) by MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2%7]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 22:38:21 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: "jejb@linux.ibm.com" <jejb@linux.ibm.com>, Jeremi Piotrowski
	<jpiotrowski@linux.microsoft.com>, Claudio Siqueira de Carvalho
	<cclaudio@ibm.com>, =?iso-8859-1?Q?R=F6del=2C_J=F6rg?= <jroedel@suse.com>
CC: "Lange, Jon" <jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>,
	"Johnson, Simon P" <simon.p.johnson@intel.com>, "Reshetova, Elena"
	<elena.reshetova@intel.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
	"Perez, Ronald" <ronald.perez@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: RE: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Topic: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Index: AQHazb9RgtF5ECaWSE2iVvmX08EwbLITKjDw
Date: Thu, 1 Aug 2024 22:38:21 +0000
Message-ID: <MW4PR11MB58721C73775C3AD60D8C50338CB22@MW4PR11MB5872.namprd11.prod.outlook.com>
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
	 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
	 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
	 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
 <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
 <MW4PR11MB5872A33D7ACFDDB34EEDC6958CDE2@MW4PR11MB5872.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB5872A33D7ACFDDB34EEDC6958CDE2@MW4PR11MB5872.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_|IA1PR11MB6540:EE_
x-ms-office365-filtering-correlation-id: dd16e58c-c30a-49ee-526d-08dcb27aa591
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?zAXopZz95GEgJ8nomACc9JgHykxTh1RRmuaA0960NaYwjwyQvRlYKdaECA?=
 =?iso-8859-1?Q?kgUXL88oW0i5X8IQHC/P03qcmTd+XWNCD26wIZgEJ5r/Z/EbBv8+gDc16P?=
 =?iso-8859-1?Q?3O6EAnw7koGzn0Bk0yD95RlpfJnsz7DurW/iQTyay8FKXYiV6/InUuRVHw?=
 =?iso-8859-1?Q?a3myNIY7ty1aGHfdJWwatj/V1kZ4aAOc2eMo1cpj7LzcQD9QZWIAKRa3eI?=
 =?iso-8859-1?Q?1xH6fj6KLmV3wcBtx/pZozhIuG7eBCzTtAaHiVGtFhsGgalLKHt08zFdeY?=
 =?iso-8859-1?Q?WWsncH1HZCdSceu2alvV9sRHdJtzmjOf+jJCgFozOZut198vKR691u8FxF?=
 =?iso-8859-1?Q?YIZePoAN6PxOwrJCh8B7lrRSVFnTn98dV+Bd2Qu5X57IFu5gHLjEA8PpHV?=
 =?iso-8859-1?Q?+ZU+S0n55iWGMaUN4jpurYUHHuxUZpaHGkTc3msT9355sl+3OeiZ4346no?=
 =?iso-8859-1?Q?dnlBoYB1ZrAEnGQp5joJBf1a4g2YqztzERVM4o47E1OXdLGEsrchDTBXlH?=
 =?iso-8859-1?Q?3WYDcM9cS8F9RuXuNue7eHnol/ZxNVq/iOj/xaiIXwLpEalOzq5489csHQ?=
 =?iso-8859-1?Q?tmvz6Bl6NLYFwJyokjcy/xt1rs9du6Ui2EwyWlYBADxnRHi+udpo8o1QdG?=
 =?iso-8859-1?Q?4OEY/iJv23fSjNmAqpOo8cVrKDJNNo/NSbRlejDtvTFcebKPgpLQf+S7R1?=
 =?iso-8859-1?Q?bUl3Bswzl2EqgcohSSLblWxsztbDdgmOy7PY8EnxjwdLQhIB8VNMDNZU1s?=
 =?iso-8859-1?Q?G6M+ynIP5ByDjS5W2hEiYPNZ2c+JnioK0JjO/Jb09qW7T5vsdK/M6YJ9zR?=
 =?iso-8859-1?Q?qqM0x/pG4QVZIb3nBaSMuI44CfukgDSV/YNpGep9NRFYsmrco1CJo0bdV/?=
 =?iso-8859-1?Q?Gz/xMATztyO9PJdDlumVGbiMEoNYU4uIZbO7X0tfyUb3BZ5YvzQKEopQio?=
 =?iso-8859-1?Q?x7lIau+4SPXtkqtJpfPu0RJhDNG/XdvcGIiw2bNDwQCR/sY6TX4cBOMguI?=
 =?iso-8859-1?Q?+XD1/icrQPWAeqPyMxg1I7jKOKgA8hadp2iDM12T3dA7oBeKNqvFySJqSE?=
 =?iso-8859-1?Q?ndwZwUQP7cWcijDlxHqqNnDHQUp2w0N/OB+vKDKjNuYfGR7RopOczjfZFQ?=
 =?iso-8859-1?Q?G0bt9waXCjAaP3vhwFtDVGd5fGn4jQSd+BJOOQ5dq1Q8MysoZNU7gkN14L?=
 =?iso-8859-1?Q?gJ0IRzlwcWa8bHCgXgUT8H5GPQqbLbgwd0J1aVcvR3dvJxfpbJQK9G0Pv2?=
 =?iso-8859-1?Q?/NSy0RCC/TLeKTl/JN73GqyJ8aVaGNgJJkRnqxLW4rjfviA001nk558wtj?=
 =?iso-8859-1?Q?bAb9HA5e8cIx8WmQV8fvI7YJWr3lXfu0zzg7ixmV1SEx3RTyGWtoE+x0p4?=
 =?iso-8859-1?Q?xBpk6WDKoc8RlPQRlb7QonlYeA9enM8lqaj1NgU95l9UvHvTmFNOA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5872.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?G7sGcOhGlZqJumzjIDC47BDZlqRkbasoGH4e454i7NC668W1e8z6Ici9md?=
 =?iso-8859-1?Q?QxgInO6D21xUCyo9/GmEhbBkXhSZXsqHPWAw1gNslBef06SZJk0wyJfGCO?=
 =?iso-8859-1?Q?yn/1UNxp5V1U+IBijLBJmJvO2njUq3UJ04/R4Fgs6O56MxZPLRd/9BntOI?=
 =?iso-8859-1?Q?/yRt9pgT7EvBy3eDS7rn+OjgRCU5fSWc3C4GGDRcYuka/B0KLl/635xhPF?=
 =?iso-8859-1?Q?Gdytbly8zXKvfvDyEnyu68VPeaQholkbWMvXqZic5DQ5k9x7lpMXvilI3c?=
 =?iso-8859-1?Q?s4e4g942/lFJX9b+y4mE1OySX0d5wbG2zf2Qqpmo4hUgSMqR+oLNS+jKha?=
 =?iso-8859-1?Q?rbbcNOo/f7z6CN2PvXO3o5kieKsOW/W3WUmfaBwXxNufuEV79mxonEVl5c?=
 =?iso-8859-1?Q?ZvM+HYwMeaQTldoTqoag4XE4xpqUZgE7LJgUfcMyT8c8mwdM41eoBKhaFW?=
 =?iso-8859-1?Q?hh7nFaWyuDbYvN1AxLY407Lu9wfAl32PYRNP+Jx7byYeHjFuhjCSflt/oN?=
 =?iso-8859-1?Q?6AUgunYdtX82o1wucaSZMDf4xlirvb1wRG4iyFmgyaDHuWD0scAJfgzorD?=
 =?iso-8859-1?Q?ZcbgQMjYYjCX4yogokt4XcVqOdyIDqaNrSXCdE5Ok1Kyia2SdR5eI8v0tE?=
 =?iso-8859-1?Q?QxRHmn6P0bRbZ2G+mW0Rp2QqQa8E6rCgm1KTAyxyoAhiFSWNVjdP2S6DKf?=
 =?iso-8859-1?Q?s8DZFrsMOWAQ9GQO5jTBMTPuqBAXpEBNW5QWWdduswWLMhpKOLlDcyn7Ex?=
 =?iso-8859-1?Q?5KouUDjX9GO7oV5YGwitlMB7m5KtZyzu2F/ZYrwXI1FUv2vLa/vzE1yVem?=
 =?iso-8859-1?Q?/yjnEfN/pjsqHnhRRX9aq0j62lZPjYuAwoNKQnTfUw/+S47rvpZT8wGynS?=
 =?iso-8859-1?Q?V3UL7b1FRLBQ6SV55b7erM/vPnwcT62iSyOlqt4y6xFmo3bJH/gIXl6T88?=
 =?iso-8859-1?Q?WNjcJkLv3VcExbvjkAJC6FzcITqjssEJDp3Z+PDe7Xu6gRWfp6MLTnVA10?=
 =?iso-8859-1?Q?bPyxsHrworg/djsnsG10F6rrXYijpUZevF9pCs6cQNTX7B5f3yE2xtS4N8?=
 =?iso-8859-1?Q?3h7Je6eQ1qFQrVlgy8ET7kcUMtNEjbC2exko4FMdrJmIqc4WhBmoIMhEIv?=
 =?iso-8859-1?Q?SPrvp+7fZCPenCAMUNFxk1RhvJpxhsCGIotZGei5UbzCJXFqdSzvf6gl52?=
 =?iso-8859-1?Q?cxGY6QRVPOd8O9kFP7RsbdHVrxNP9Wxe+lT/OUyATT9iLVGMh0V54AeCRp?=
 =?iso-8859-1?Q?HvRX1/7JmdW12hvfrUMNuEUQ/dI2804ce46SBUyRNN/3pxMl5cTVrHbCUN?=
 =?iso-8859-1?Q?2694o9TdW7TpwRXrjzl3tU23mzFW3688iW5z4F18zKNCWIIi47t3nzL0qe?=
 =?iso-8859-1?Q?sWQW8vrlDyYG9aHTK/3w/skG+Z2RrSbr+FNEVvb/JeorJUmuzC0LhqV1Ka?=
 =?iso-8859-1?Q?QKNURs/9dayhsB/KvOvOFXTCDKpbBvnWZbzjvYifAjoTmtJOX6p0XrAEuJ?=
 =?iso-8859-1?Q?6MLoi5A2u5mz4bmrBttkvxeemVDV3i2EhppskaUXNpuJZyRFw02HBDLuEH?=
 =?iso-8859-1?Q?2CiQOAYGI2WSRcZ4uC1BvhMf4PJ7YJCix04OFvARD9bgxdySwn7G0zJzMr?=
 =?iso-8859-1?Q?mag+ZwTPLp3xrR9OQJKPjltUfmB3GSVA+9?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dd16e58c-c30a-49ee-526d-08dcb27aa591
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 22:38:21.3139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00VkhE8U4VqJYcawRYm8FE/vWsgeOBB6QY9ry5EB+BqYgAracTZpqQwgY37OuNlFP1Zi9eEfHTKIgMngraly/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6540
X-OriginatorOrg: intel.com

Hi
As follow up, we have drafted the vTPM document and put to https://github.c=
om/intel-staging/td-partitioning-svsm/blob/svsm-tdp-vtpm/Documentation/TD%2=
0Partitioning%20based%20virtual%20TPM%20Design%20Guide%20Rev%200.5.1.pdf.
It describes the current TD Partitioning based vTPM design.

The chapter 5 described the TDVMCALL between L2 guest and L1 VMM, to detect=
 the presence of L1 vTPM service and initial measurement.
Please let us know if you have any feedback.

Thank you
Yao, Jiewen

> -----Original Message-----
> From: Yao, Jiewen <jiewen.yao@intel.com>
> Sent: Thursday, July 4, 2024 11:08 AM
> To: jejb@linux.ibm.com; Jeremi Piotrowski <jpiotrowski@linux.microsoft.co=
m>;
> Claudio Siqueira de Carvalho <cclaudio@ibm.com>; R=F6del, J=F6rg
> <jroedel@suse.com>
> Cc: Lange, Jon <jlange@microsoft.com>; Dong, Eddie <eddie.dong@intel.com>=
;
> Johnson, Simon P <simon.p.johnson@intel.com>; Reshetova, Elena
> <elena.reshetova@intel.com>; Nakajima, Jun <jun.nakajima@intel.com>; Pere=
z,
> Ronald <ronald.perez@intel.com>; linux-coco@lists.linux.dev
> Subject: Coconut-SVSM - vTPM support for Intel TD Partitioning
>=20
> Hi
> We posted the initial version of vTPM support for Intel TD Partitioning f=
eature to
> https://github.com/intel-staging/td-partitioning-svsm/tree/svsm-tdp-vtpm.
>=20
> Feature includes:
> - vTPM CRB MMIO interface
> - vTPM CA generation with TDX remote attestation
> - vTPM Endorsement Key certificate and CA provision
> - TDP L2 guest vTPM detection through TDVMCALL
> - SVSM vTPM startup and measurement (SVSM version and TDVF).
> - Ephemeral vTPM NVS
>=20
> This is initial version and we are working on the improvement.
> Any feedback is welcome!
>=20
>=20
> At same time, we find a potential issue https://github.com/coconut-
> svsm/svsm/issues/404. If you can take a look and provide your thoughts, t=
hat
> would be great.
>=20
> Thank you
> Yao, Jiewen

