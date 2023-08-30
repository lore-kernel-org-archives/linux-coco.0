Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D06749D
	for <linux-coco@lists.linux.dev>; Wed, 30 Aug 2023 20:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693429033; x=1724965033;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cnuDTV8XTqrSeEAgnY3pWuz85ydj6sr8+CH4LN7Yn8M=;
  b=ZqwGc6rN5Ur7i6/kTOYB9456qqadwgwDrSCL/RcNW0SsJHnJnk7MgRNV
   PvbGHvz9J1yHe6hoYKDByTNU+sXC0X+BoCYoTIo4Aqnw4Fshqf1xbiyTf
   y5ki02X7JXRJXow02umuzHuDoXj3fNsM8DE6JvLeaKjCwyDIIZsm0iYJT
   ww2/FIiK/PXZYneWeu4Z7c7nGsNahSh/deRurdNG6HSThJUxl4AV+9Ao3
   dKayZKgpdqRtd5lypFATkYc6WBi31sTbcH6yeSpiqBYD0mFa+awcFlnZ7
   AXFnhh9mCaWXyT0VlEmU3GS9TNKqveDsFV9y2Pzwyxw/M6KYFfazroiRA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442110307"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="442110307"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 13:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="1069962842"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="1069962842"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2023 13:57:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 13:57:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 13:57:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 13:57:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9F90ABinQvlBgxNBnKOoRcQsp3g0PLBR0oIufyVtYnkR+wQEOWFTTcAMVxwTeezbywQtvSPKCEYnD8w3FfAqIW8u8L9CF8t1FZf+zp32L6ApOr5pjuwXY1AOZpMRjkqKuS413UKJ0jk8JOOC++KgmcoJG44E8RLvjbBbWeL8tbN1Q6NPuktxOzQ7AFpneoHw1GNadj9xXPdArIyyEqT0cGIDYh6okgvJkeVq5JCxspSZqO++AdATMeXnJ3P3/iWVJHTkTqAHY3TcpjrkhQeMVb0XMUOCIdvtDwPmjdKgkNGy4+n/Bn+XsptmKO97hNkQ1K0qgopE656FlYansXhpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtreAwqjnh8M41d7yw31yNlGT7nbljeqMuzUj0bBOtA=;
 b=J5bN9pPNIV/id3LyjvXgbaVwqLJYt0ZpQ/C1KdtPP0iAInMif9EU7uaWkMmHCdJCLTlzOKUkMnT30pYRAzyd+ApIy0XD3zLe4v8nO0ClDZw4jCUGGW79yLnLwMLUHg6QU0ROdbpvxnGhZUWRdBfXerfZTpyoABDX6C73gwKRhmueeQmkRMy/CIysZL2SmQdxwlwimh8lL11wlNJiw5OYe88VK+ukiLjhM2Qh+DLZc+NC76CnM87OS+AaHJuk1u+pCcAfvgXMx2k1UPfPmnD3A70xkt47O1oi4AZegvrfCqvzNR4ia7h48ld6WrlYtEj7uEmuqiVLzlG+ctDHnal1wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 20:57:04 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::385e:a559:51bb:fa45]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::385e:a559:51bb:fa45%7]) with mapi id 15.20.6699.027; Wed, 30 Aug 2023
 20:57:04 +0000
Date: Wed, 30 Aug 2023 13:57:01 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams
	<dan.j.williams@intel.com>
CC: <linux-coco@lists.linux.dev>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, Dionna Amalie Glaze
	<dionnaglaze@google.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Peter Gonda <pgonda@google.com>,
	Samuel Ortiz <sameo@rivosinc.com>, <peterz@infradead.org>,
	<linux-kernel@vger.kernel.org>, <tglx@linutronix.de>
Subject: Re: [PATCH v3 2/5] configfs-tsm: Introduce a shared ABI for
 attestation reports
Message-ID: <64efad1d3b32a_29e2202949f@dwillia2-xfh.jf.intel.com.notmuch>
References: <169342399185.3934343.3035845348326944519.stgit@dwillia2-xfh.jf.intel.com>
 <169342400469.3934343.12316161608372095860.stgit@dwillia2-xfh.jf.intel.com>
 <2023083029-wackiness-lilac-39dd@gregkh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2023083029-wackiness-lilac-39dd@gregkh>
X-ClientProxiedBy: MW4PR04CA0148.namprd04.prod.outlook.com
 (2603:10b6:303:84::33) To SA3PR11MB8118.namprd11.prod.outlook.com
 (2603:10b6:806:2f1::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8118:EE_|SJ2PR11MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: cacc395f-bca6-42fa-64b4-08dba99baa4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZL6MT4ZiZ6mWIEJYRr1GNljfJOSZokKjTiHSw74nN6M6BPqCKJcYdaMaBXQqVA78HpW3QpRZEJuVtxM3hOQBkWuMEWRe+BGzX60VhAGvhR4EZxqyKwya752hLZGzxILZGrVj1tjCQBSYvE3t6oZysCgMdbXMTmwqvKH1adTCTiZ6FrvTkBVAAo9vfkD2RlWXotZ9JMBjOAzWd+w0IOsJh/7rIUInm6OE6kC9ukTwvhkayelvOZnMCwu6vPpHyW01+PN9cVMbuOnVRUGKpWBssc1zn2XkEkiSVAzLiUICfb/i8Hh3dEWYBV62+r/FRJv+DpZ22Em+pz844jP/Mm5I0ZyjZ8ogAaiglI1JynMpSwBwxbgpvTKPBFeANu78FiZHdjSwYoR/ZR5YNsxiqze4PHMDqjlJk2WZfk/bSsbG6wCNbhLzHnvxsx3Aii3/WnC+h2zjLcjoHuEZdacM23IJh54Rf0p2kj86Vd2zWnydHRZFyb1LS7FKNY+tWw9Jso2Df3KnSBdK3I225AE5nbHC/Btjye9PI0IYQbUJDiHevgHbcXzCESzKpsmvWNuFMY9c
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8118.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(39860400002)(376002)(366004)(186009)(451199024)(1800799009)(4326008)(41300700001)(86362001)(7416002)(5660300002)(8676002)(8936002)(26005)(6506007)(6486002)(6666004)(6512007)(9686003)(38100700002)(4744005)(478600001)(110136005)(66556008)(54906003)(66946007)(66476007)(82960400001)(2906002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bEY37S5Tx6in8MkYPXnRUS1JQhYBDsN1KcDKOeJlMrfhxsY8xB30wUvW42d0?=
 =?us-ascii?Q?B0udd1nnFRl4Cuax0bNhbcsx7b8PeQshBrmJwvWO2ecbvoaAG7lQPngvaglS?=
 =?us-ascii?Q?+Nlw79MCIEqMGz4MD0YNLwdZ2LHB4lBOgUF+6QEdhm9qFG+N1MWpohEVBFmN?=
 =?us-ascii?Q?g4TBtjH+mPRfz9LqXI4a5Bk1rYNBPTi6EDtib80DredJhRjZAdxk68q85snO?=
 =?us-ascii?Q?KBCBdJPW5L3J9Jqg96ex0d4+ztAxZPI4L5AGmH5+5qLnch7K1fo3+eaibORN?=
 =?us-ascii?Q?ApDOO+ZbHTfLVw1gFUnSEv9whsvHiqA0rfEvoZ/9zkaxgPyCtRf+eYLzkV8J?=
 =?us-ascii?Q?VUahVcFj8T56ydrfc7oz7oQTE8AbXX8lDOH5tJsw4ndkLRkQvB8s0UmV5Z6x?=
 =?us-ascii?Q?G6kvOE2QNkB7rmrkswVbhwiaBMx5M4n4EIQh0Up0Ay/5qTMwyaKawZdmj6Y2?=
 =?us-ascii?Q?o5DWItcxUTqdQrCES2D28ORHOOy4KhJva1mnVhHjffP4DbFhC5+XLFlpVJs9?=
 =?us-ascii?Q?DkQJbCNDQMjtOEQI8JxnwFZKG4nZU55qt+P2OL9FlK/RTtIjofIRcUJkz+2K?=
 =?us-ascii?Q?IvJi20aq8OyJN6WkzshlJh5yzWNeYPKnvvYFIFtUJ7WH/ur/rtUdlPVUtIW3?=
 =?us-ascii?Q?zz4Dd1kpoqg+JzJdFxh87Rsr8dzYH6LySCSvtxL5lJi9XjlB0j/MUzPt06KQ?=
 =?us-ascii?Q?f1cQF5hd5HaaS1ZxJdFKLCo4VBOFKspyJ/BWqGKJ3goFiDG4b++PhEUv8J/i?=
 =?us-ascii?Q?j9Od/14ugNZkxGBJJMY+26NqljrpphfpS05y4W25Bq+SnAaV3402uQkoBCjg?=
 =?us-ascii?Q?64/3BUZdTLRa7oeEHs3XesXwNv8AHsFNFaQq8QVktMnrJNDxHOQx4FquOUWL?=
 =?us-ascii?Q?mXtECzN3rDGftCDOceQknrHi0LxA0rQWLzyvqAhjmq4kDT1vD8qKq8cob2a4?=
 =?us-ascii?Q?0ZoT4bQgKlakO6cJ1tjdrWRzvfXHeNJNRHZ2A7Rx/bQm8ByHjIy1lV/nhjp0?=
 =?us-ascii?Q?dM5orvxjSQQEHxUxSvMpzpFLpQ6i/i8oaze8nbW9+Ygn5WPKssn6dBFwd6wr?=
 =?us-ascii?Q?yUnID7xOHxf15YUdtAy3b20UJNBUJQ281Il8jkjaV2+E4HhZKKHORhGQF/wr?=
 =?us-ascii?Q?okZazduvirJFqlsb0olOJWJHf+OcWKJkRbwpcvqfal2Ja/1Jh+FsO9kze3so?=
 =?us-ascii?Q?h+3lcgWl7ygXq1k+k3HiSALMe4TAWSYgmeRg8dcXuBWFGbiyumCBuXEtOKC1?=
 =?us-ascii?Q?USJgAFaGZCngam9ym3DFNFSGk/Jg9s3FpHopbsU9jb9EE7bjPIg7vgjaFTAa?=
 =?us-ascii?Q?YsjuPTFoDrBwVd3SPu+EjUu3k+Mhlx91vFN4ZCbJHCCZryLWh0avJgNx2fPW?=
 =?us-ascii?Q?GuFPpgHLzQmQr/9wcvY1oatEsfgozsu8uQjYSZQ/K2m0x/4WhGAgLt+5SEnh?=
 =?us-ascii?Q?x0rQYsIzLtYFoOYFDmWMlgW5m0chuOly2v2bLBCc3kYgF5dX9Pa4erungi57?=
 =?us-ascii?Q?7kWxoM6/EJ6iguVYWACABLAfKbFSLDg15h5cvEsFljJtRiso/9qIfSaVkKim?=
 =?us-ascii?Q?T7q1MCq8q+5ZDks7VOv2aDIfMu/uSlamz3f8YwS2orY7ATQPV5thR/FFOoyZ?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cacc395f-bca6-42fa-64b4-08dba99baa4f
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 20:57:04.6684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQDck0ysXaFSkqrH7ezCIrgRya/PPYaB88W9BThJy7a14LqBU2cMmfQK3Oh/dGvJqZuUBrj/i2Z07q41rRI167Q9byJk3tnXOC19POtXTWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
X-OriginatorOrg: intel.com

Greg Kroah-Hartman wrote:
[..]
> > +int register_tsm(const struct tsm_ops *ops, void *priv,
> > +		 const struct config_item_type *type);
> > +int unregister_tsm(const struct tsm_ops *ops);
> 
> Usually it's "noun_verb" for stuff that you export to the global
> namespace these days.
> 
> So perhaps tsm_register() and tsm_unregister()?
> 
> Either way, it's your call:
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sure, noun_verb works for me, will make that change. Thanks Greg.
