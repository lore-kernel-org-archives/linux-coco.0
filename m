Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E0B4C70
	for <linux-coco@lists.linux.dev>; Wed, 29 May 2024 00:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716941716; cv=fail; b=Dsf0OUlrWNagyD2o3PP9oOBoMm6YV8IKRWb6qHsVlsjSjJsqZgP0Ci+AeQrQLp6D+eDjlv1B4hNsj0u+wpEOP5QH0LXdPDciWb6OH9L9jfkQia326w6nxrE+bXoDsFCnJNp5FrEO4ool6DITGD751McIa6b14PUy5vRp88c+qPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716941716; c=relaxed/simple;
	bh=5BDEsTm+07yqTb0DKK0C+PWPA1gC4eumNmHws/tarXs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G+vk7b/JfAFvqmOjifieockSIgAIsQXXbJnYrMf7JmvEK7rfdoAxdtZRJo33TusetSfy2djZNJdi54x6YRhavP3/Q89yHn+JAP+UfqVLEnk7Nq/aF7ocewwZgsn078Z0zFOvBdpafs1VZu/XoX2da1M7xSCfsIr2o+lc9meWKBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PESk/VKA; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PESk/VKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716941714; x=1748477714;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=5BDEsTm+07yqTb0DKK0C+PWPA1gC4eumNmHws/tarXs=;
  b=PESk/VKAvwL1dxAlKWDR9iGLQckjZrsE7fRyvNHT5V9WxtgKyEhTogXf
   dZ9y1ryBFFKycVJU367/TSXT6OE+psUtzOdVn/R11Y9bHyHNcb0FOZFGp
   VPYN8xVBVyRjTnbSlPukxNPU5msrzZgeqcWEZWay9vC4gYtHY5CrHLouj
   y9L6mPdHLyqwgrhq9m19OWRdhqaZOCl3Md4L/XOInampW6+nNda2p7MMS
   GIcK3ICHLEeXZudoBJNQ8J6zklgc8O9wkEp2a0GUsGLFoZ+kZIPymZXI9
   cGD++TkygwxVl9gemtKUXmiKYHoQPCujpsLxsNc9peAGzzUy4Q+S9BZig
   w==;
X-CSE-ConnectionGUID: xhbrozsWSV+y50kppjhB3Q==
X-CSE-MsgGUID: DHE9ky/FRI2u5jOxVKnhSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24449202"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="24449202"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 17:15:14 -0700
X-CSE-ConnectionGUID: OF0Uy8HRQOmpbOqWAKkgcA==
X-CSE-MsgGUID: AwYhRRXDRN6Zth/eEJn1fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="35312979"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 May 2024 17:15:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 17:15:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 17:15:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 17:15:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 17:15:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUD6PWvQaN1NfZDEDMbKofY2Y0/lE7xFPWQpY3KUr8nPwesNWozMhWX79nKpDCMXhM62eO2H4trrmByNtE7/9urSijL3hUmCVt+K6xyfg7Lid0+1bbSZDiHWM0N6u6nbDK/8jd58sE0h3aVuMCv3tmkXwrkrCDtOAqOdHvoRaaeZyEpjmHXPhTNBOiCKMK6ywkT0anOiwcVdfYWdXI0Z9zmR20Y6ypbZbZzwP05l5aoOjfj6TSV9odr8pDxGtQQIvHpztgCbr4qP1IBdmJfAH3PFYZaSzAkngmIY3TB+1KLn4HtX4zkTm/S4Q0hpJo1GHQKU603pBxdOJCqsln8j2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsV3SEAu65Bbxlutn05qv0cUng6sRjXrEDs+bMHyy2I=;
 b=dH9emmTOHnNOA/eCV9rIeyuYV+OH/4Ib/TGzptGrIpLhfoCi/FXQElhERdKu6sVv4tfy6w0dazNs2SsqPEsEr9B937xM+kuwrCSgV0WgcwNzAW23a1q6oaZXdvZFYUtvMp7fcNRbuTfHoLZcg250E6BAOQ2pCaSpPrLc2TQIVoAo9EbDGdFJmTkXszc/OMBi4yh4AGkD4UgT6sUmPO+kfjGpB3rRmDxqjNj6XIQ0B9rEW86J1yDrlKTUlliDFIoGdqZGZOn4a/26/MD026uF5AMiscNBL7LFvMqGWXoKyc50OiJjPXjbOPcd7QKts+y3CdtSCQETEfQLFnAmEi394g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5)
 by DS0PR11MB7383.namprd11.prod.outlook.com (2603:10b6:8:133::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 29 May
 2024 00:15:11 +0000
Received: from BL3PR11MB6458.namprd11.prod.outlook.com
 ([fe80::ffbf:9c19:a838:176a]) by BL3PR11MB6458.namprd11.prod.outlook.com
 ([fe80::ffbf:9c19:a838:176a%5]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 00:15:11 +0000
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>,
	"svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: RE: [svsm-devel] SVSM Development Call May 29th, 2024
Thread-Topic: [svsm-devel] SVSM Development Call May 29th, 2024
Thread-Index: AQHasTpsRv1Gt/bsC0mYCFDjBqLme7GtVmIg
Date: Wed, 29 May 2024 00:15:11 +0000
Message-ID: <BL3PR11MB64589F48AB63EA77FD06CDB38DF22@BL3PR11MB6458.namprd11.prod.outlook.com>
References: <ZlY5A4N4S88FeFDQ@8bytes.org>
In-Reply-To: <ZlY5A4N4S88FeFDQ@8bytes.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6458:EE_|DS0PR11MB7383:EE_
x-ms-office365-filtering-correlation-id: 3b809b63-e55d-4e12-e81c-08dc7f746796
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?jTw14NrQmOa9jf3P39bdYiSBebObUu4jht0Jgr4g9vh1QqC8JnMnJ31TwN?=
 =?iso-8859-1?Q?XC0CIb9/A/T1ANVn/RbFeVEkZ7lwLQl1KJXzMpkmYdsqH1z2sGGHe8cMTh?=
 =?iso-8859-1?Q?2RpwuiG3W9oyliXYJhP9pxyIVkCGTN33nlFHabiioeT/g+hD2/pqm4N7WU?=
 =?iso-8859-1?Q?zsxZIm07Ql8DdiyT2muEMdRQRq8LzfmZc8A8abb9UESy4+9YLfZwyatzgO?=
 =?iso-8859-1?Q?3O6OQZ5PNz9+lHbjh59YW0yFHiLPCoSF8KH6l1g+yOuDADDPnT8deOVlsB?=
 =?iso-8859-1?Q?M7n07dWG0Tkahb5sSRltEV2dK0W7CWXjd4+NFAy/mpdozDUo0P/+lij8MA?=
 =?iso-8859-1?Q?vr5jnlvzDB7nbIlabycagD6voxedWDnTN8zAWIH56B8viBgAJeqO92fA18?=
 =?iso-8859-1?Q?pSkQ/bGP0QH5JE6H8+MV0UIUnnunjWKTA1MfD51zNnmmLrubL8qkjyR3HM?=
 =?iso-8859-1?Q?N7k0uIz3CdBU7slrZy/gQIKuatYlNBdq9W+ZiLdhn+Z9+TwiXjozjOiaZZ?=
 =?iso-8859-1?Q?9phXzWo/mp9NagQVF/2bNoDmdoDi4KBOVB0At8pWO4UAQqfKKdCmNQQ73V?=
 =?iso-8859-1?Q?z9jiP3/mPdTj7Jocp9xbxbImYerHU1ODSqo8JLPScK8h8+3J0x9QQcLnYy?=
 =?iso-8859-1?Q?WuMQiOWzzDLr6urxdIDVQFjYaFlpFLnJUisVnjzBAK0H/24KC2tp5kh7Cq?=
 =?iso-8859-1?Q?1mRBoIcM1HaAbHFdgxZJsTJArDXY6S2HSewDxhPoUr0/hfNvP5n9esC7HD?=
 =?iso-8859-1?Q?aqvuLDZOXEBGXqGHKQbwfyZxL8VbYZ6tpRmM1KjGJViiHI/dB+OXdHtOvn?=
 =?iso-8859-1?Q?q2n6uD+7mFFCIR6E9oRH+QalEx5GXmVJ31gAJuSvEJQ3L+QFbFnVXNkmX2?=
 =?iso-8859-1?Q?2UOVENcbKgbPQQfkhz9JgRSa9gjGK7FJcZWD84fzjEWI6MuMk5tfEqSfVe?=
 =?iso-8859-1?Q?3BwnmXXuWNm37Iep5N8Rlel59jvtbSLYWaGM925iESN+scPUClG1kpq/yM?=
 =?iso-8859-1?Q?4r1MU3DTaatfsBxPdDISGoXjqhkOyWDC4nzerRen/Pk0HGKIKANrzLKjF+?=
 =?iso-8859-1?Q?bMA9MHX0MRGXA+3k3LX2yG5c0yPsThTjudqf7u2ic6ESwOSDlxqLS6kWXl?=
 =?iso-8859-1?Q?JpAmyP/lB/qQmdrCiuA+ggO60NzCJ94dJimRveqGEio/k3mz9pEhaxyRci?=
 =?iso-8859-1?Q?ZgBcZG1aHB13qfNAV30jKvsAhM2Vs9SBxO0UclL6emuAWAxtTMwgvKsBpF?=
 =?iso-8859-1?Q?qVC12kFmB87xaYKJffc9uE/nafOI60Z6mmo/l/lB2sZisJpZJVXiiB0aul?=
 =?iso-8859-1?Q?hpYRFcd9R1WiLybFGkpqy0hbj2n7NFl80jbqCeNTwEU9bNQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6458.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?C/55vwTsxbNpJG08OJeSK8+Y6WC3f7Pbj81kFLX2gWE31Y41gFV3v3AcNf?=
 =?iso-8859-1?Q?+5k80qsyhSLtFRr0sPO+sh4OeFCGlW/G4KC2bARfdoAuyMzIftDm3lB6ls?=
 =?iso-8859-1?Q?9pdZbSMUc8U+oqYxKfBI8H3Qe8XoyWMepU1JYP9YE/DKhMGS2nF6GHHsDl?=
 =?iso-8859-1?Q?ZhLdCBq15ksA24QQ5XEn6lhvB+QOPgDnIBwx5syp2YiqhKa210qNaYj9Yx?=
 =?iso-8859-1?Q?S1aRjdcqQrSQmhlHbtektsfwRhZAztEEvn+jW9c5oZC0lW7Qs6790dDDnJ?=
 =?iso-8859-1?Q?MlipumG9DNSN70FFbSJsd+l6DSd7AixaTN3ysYjujK4Mn4CLuONmvQmJRu?=
 =?iso-8859-1?Q?hTAEmpiLfVrCFZAPaob28wOMbyYwixAqfajehn4fO9loPcrC9Hl4MyhiKA?=
 =?iso-8859-1?Q?6ENN5ruCQE5GsfyRUL7h5OZGmTWeM28F2GCNSEgIjTcWaTsWj+tXGVtCY+?=
 =?iso-8859-1?Q?64X2FzWjZ0XsR6/jd6+SPymz8seqgo0yuwVFZioxUdccW8Lj/JNElYQNHQ?=
 =?iso-8859-1?Q?d1yjmecrHfrjY6KymWiKU8hwoqpRKuS3MgVbbIfJ8HTI0UDIEDiAESTxCF?=
 =?iso-8859-1?Q?QA9M8QjdWJXwKKGWUYNW3yd8RUrIxG+dqbPnW4j5Rjsm9cV4sRhlhuGK7l?=
 =?iso-8859-1?Q?W3KgCzaFcfVR5JjmHvR4ACZQ98oYf3QNhm/Tmx55KhJRTdRWHVNDs4DhuG?=
 =?iso-8859-1?Q?erHd0fyz5+0XVNqDdZjjMlUYKp81G6oei4Ks5n8I9xmgx9eZIvQQddB6sj?=
 =?iso-8859-1?Q?kWPKxEE5dHMFG2m7JY+MXO6X3obNTNA5pL4+ANxF8unLR6TRtAUKg51h4i?=
 =?iso-8859-1?Q?Q7FaaXUkjJdLeDJLs5S7Q4z+qI7UKqQosTk52zcylAZdnpnYqyauTgl/RS?=
 =?iso-8859-1?Q?QuyMyUrChDUgpep2INHItB2zCRvsVq+bx2vim4hfwu6ZDle9x2meThr4QO?=
 =?iso-8859-1?Q?7TvEUzqGw2K5/gjWBPFYEzVhw+1hizyJbVeouF4JNKIB73goi8NPuBER6f?=
 =?iso-8859-1?Q?deGOsiTOLfGqtJwXc0nFP0buHrhbR7aDogG3e0pC4wbMTlNikIOkxY0lrG?=
 =?iso-8859-1?Q?jv6t8X+fKfCRlQg11K8P5TjUVtDITRyz3i1I7SWilCH7LSIh/C9+xwb+Mg?=
 =?iso-8859-1?Q?ZhbTcaRduZE9+oZPMbn+A4kcOCKH0Et4ovgGr1gBROrhOqzGOpF+t+5lZ8?=
 =?iso-8859-1?Q?rTgVnIW4KLwQsbls1eHuhqMELjDwn68KEEh6p45Ls/53V2BOMSTFfB5v3o?=
 =?iso-8859-1?Q?vHKWAdICiulNahOh3j8logKADBCbydSp7+uaY2tUfGRiFTQqFin0lMII6f?=
 =?iso-8859-1?Q?ikjZvs19e5z+tsDtUEl8GPmQQydn2XfQsXqP4yDk9UxmVEemTvdtGuNQzH?=
 =?iso-8859-1?Q?hUfn+pgCBUCWCA+rODA5TdM0EKhCbPdckF27h7KYyjszMUZYxe9Vf18SPp?=
 =?iso-8859-1?Q?PSMeUcAq0Lp7th7ROMVfz0fz+yPEmlwd/YqGX1f7J4rei+aA5hbkTBBsZD?=
 =?iso-8859-1?Q?dZ92hjUQE6HJF45KqZC2fJXHC5yak4wJZ4KVuPcOFzN6mg8fHR5V/hUknX?=
 =?iso-8859-1?Q?SF65pT6S3Q0B8E7DGbinumrqm39IvHyyQQTyy+MuLwZOyat02W2oHHE2q0?=
 =?iso-8859-1?Q?jfOBpWllXKRbgLTSDNsfm9IUaGGUsccSnR?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6458.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b809b63-e55d-4e12-e81c-08dc7f746796
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 00:15:11.0566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4YCfz152DaP+p1TKtP3qqM2U0Ascs/dBf+hbWJkZAGNymdbSQAARQsamgzbHn0rFlHdS55EGKra094r3uZJw7+N0WlAB6s3DTyh7Z8no4ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7383
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> On Behalf Of J?rg =
R?del
> Sent: Wednesday, May 29, 2024 4:05 AM
> To: svsm-devel@coconut-svsm.dev; linux-coco@lists.linux.dev
> Subject: [svsm-devel] SVSM Development Call May 29th, 2024
>=20
> Hi,
>=20
> Here is the usual call for agenda items for this weeks SVSM development c=
all. Please send me any
> agenda items you have in mind or raise them in the meeting. I have one it=
em for the list:
>=20
> 	* Update on my system call design work
>=20
> Details of the meeting (GMeet and Calendar links, meeting time) can be fo=
und in our governance
> repository at:
>=20
> 	https://github.com/coconut-svsm/governance
>=20
> The meeting will be recorded and the recording eventually published.

Hello, just wondering if the meeting minutes published at https://github.co=
m/coconut-svsm/governance/tree/main/Meetings are the recordings or there wi=
ll be video/sound recordings published at somewhere else?

Thanks
Chuanxiao
>=20
> See you all there.
>=20
> Regards,
>=20
> 	J=F6rg
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
