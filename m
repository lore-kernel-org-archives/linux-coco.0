Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471CB347DF
	for <linux-coco@lists.linux.dev>; Thu, 19 Oct 2023 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjnGuJiz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697747064; x=1729283064;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=je1TRYBqD5fjItJmjTFVHMyvtsOWNKc6OP8+hjcsekQ=;
  b=SjnGuJizvlOLSR102aaADsMUsI90hi+qmeNSegdO3An6pCcxVbO4emts
   evW9N/fKyFZTYzj9FkO234eNcWTdRqPApIjK2YTRb5Jnepzj5cVV0ukRW
   qqpjPjIoIU79AUiUxl8ZhqjZHtXGPQhVDobPT5oh5rLukDTbr1ODNS5hE
   eEk1bdLK47BkytSegfIWEEDhGDbRpigKCXNUOs/VQQmlX2ucUewdftBCM
   Pzu9I1+3HfTgAZm4+n37J7JZPG8SzKV/lok+/dNOSpHhENlgLZfMKl/kF
   G3X0C1y4sp03ByaPbzkl6XMCRJNmnMdLPkbRUFbJnacTUtS3gmTRqrSi3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="383576655"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="383576655"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 13:24:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792143993"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="792143993"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Oct 2023 13:24:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 13:24:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 13:24:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 13:24:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 13:24:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiQ52T54e+/AIA6jRRqt3WD5OI2SJwFBvdrWgw1fxxsd13YjoioNdCjjIJ+7Ev4L9wukjVw5xxvgzKJ6FFJbmH8RTH3R2YGzfA/Qi8Mi7ohCkL3qRhcPlsb7sg0YH1ouOHOSpaHOx1Yjquf26kiIW+mceAUXiNOxO/2inWMr32d5AB6+8xPuML/HDp/OKAsj14/n1r7GPwRhySHoh2tikwv3xKvTKmXbYui2bc+r+of9dVfV+jztbt3NyLuorWCzTuhnHmzhwwKr/KfHmdqjrkwwAQ/ctCtSqQEI1rQ7/LAY/EKrU+hdLpz2tMJwMOVkYISTNCn/Sa5CgmbMN0VXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkHJBCI0OeEuKTQL+IE2jYAecJC0U2YiGnZTz8kaEnk=;
 b=S+42mo6aiQVc8OlIetvVjSmZt4JxlVdGtgg/tVd4IQ/pTXjUSclZDR3Vj4CUE6QELkccDC6w/ttQTNsYYwJ9ENNelgp8qJTe7gDf4RVX3Xpyniwr3W6qPnn2EoCA2n4Z9m3K+a25zeHoyfd5Pf3mtiWLc8MD3cGwZjxV2G+PSzK1BJrnN7mrbJW4yTKpsUSn4jJSeS89F1cBO8ObT76uZ9zo6jOrJ42lmEGz5rURjf4XOO/qsETReuRLiFvMOMtuVLIFigOjUpsUz9pTetzD0We4rJ58hMmfkTWacE1Hc3soXiDIdPonwzPxW7j92wYew1Zy12/qi462CvbU4HIcSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA3PR11MB8004.namprd11.prod.outlook.com (2603:10b6:806:2f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 20:24:18 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d%4]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 20:24:18 +0000
Date: Thu, 19 Oct 2023 13:24:15 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alexey Kardashevskiy <aik@amd.com>, Dan Williams
	<dan.j.williams@intel.com>, <linux-coco@lists.linux.dev>
CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Dionna Amalie Glaze <dionnaglaze@google.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Peter Gonda <pgonda@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz
	<sameo@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
	<peterz@infradead.org>, <dave.hansen@linux.intel.com>, <bp@alien8.de>
Subject: Re: [PATCH v6 3/7] configfs-tsm: Introduce a shared ABI for
 attestation reports
Message-ID: <6531906fc5494_f87929441@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716325275.984874.18286682727336216616.stgit@dwillia2-xfh.jf.intel.com>
 <9b919716-127d-407a-85c2-df81cbbd9ba9@amd.com>
 <652def355ef34_f8792949c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <d6515cba-1751-417b-ab11-980010472aa4@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d6515cba-1751-417b-ab11-980010472aa4@amd.com>
X-ClientProxiedBy: MW4PR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:303:16d::11) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA3PR11MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebe4a22-2c8e-4af8-a396-08dbd0e15eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e1vGzQC0sUeyFSzIu4VIhagEvcQgGCHD5WP1ZgIjZueIPJLBWUlvE45r2svOfUkCGACYq7YEmvDQWcTsUbl5ng0E2uYURW/xGQ2wbpIJLQCMTttKMQDjSLLnGkytHhDD0hTm8u0BmPZcvaSYS8Znl0x4YEqS4G0/Yw7TD5SZ/DdI7vKla5OLhihUO08hpvTIpRO2U+Hui370/GxhqQ9QjI3pu/ZjWK/Xg9dew3Bxp72CCH2WpoQ9jjv3NkJxuGh1Vv8OZrFd67/UJKpOgs5TpFGaXiwC41JCIjSyzAaIBGDRhBNPKNLBiVV/PkY/qNzdl+b5qdFHAj0VgSjak91b9u8AhrnKdnOVLuyS0Roy0J6NBeq+WEB01ObAV98GELncmjYwasEGyhBvRdTR93mzQFtx8ThA2zkc+iW7oJVWCLf4P8oVxyeeIexjZQ8ZotmgOsW4r0AebqbfYGLH6muyaBXK00COUvyP9chK/UJcwFxY/Th5jyFYviRDVWPwEuC22QCz/OY0A7lKwNSDCQMWiS/XpXvX/A8SInuvH+OR+4fO2O9DeKVq3hK9vyeKyoR/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(66476007)(110136005)(86362001)(66946007)(6506007)(38100700002)(82960400001)(6512007)(316002)(9686003)(83380400001)(26005)(6666004)(8936002)(54906003)(66556008)(6486002)(2906002)(478600001)(8676002)(7416002)(5660300002)(41300700001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PTdk3okt5Y17jS198JMZYJ7MdQtiBeolGxjrwsZ60Lm+c1SCfrQx0wn5Oj7P?=
 =?us-ascii?Q?xtlNbZKkkyVN395rp7n9QOV98JOYwvvheh7Q4QQngeqEB7Uc3I6IonfEKFWS?=
 =?us-ascii?Q?/Mh3Dk06MCCXGs/4ofjB5iqqEBO0qbjLYHdwWni9eNm0al55mnuxZ+Gx8+Av?=
 =?us-ascii?Q?G3a3XPpt9+M8d7VQQwS/qq96o0ReuNWiwokvxEu2TmR1wP5ObTVpCaQPnRpT?=
 =?us-ascii?Q?uhd86bkse1MjAYhnuXU41AuxVE/4s8wwVfFYzJ7WV7H+NnUn542QvnyGn+qj?=
 =?us-ascii?Q?A+hrqXfK9W11KIKsNUGELDQjFkvHepVDuYaWBm1yqS8uIA6KVyLCEohWCUIY?=
 =?us-ascii?Q?JUzoBWVIFWGMgmzqU8254ZA6qS1awU53DiDJucdbgSZGjbUXumqCPyTV6odg?=
 =?us-ascii?Q?UxNNyz2nK7sbAV8soEkHO5PmTikZgC1M3JIXIj1y//3l/AzD1BgeGIepGGMz?=
 =?us-ascii?Q?pFh/IZkNGNKkCKfR9Ngz0YZM7pDrjaWhZuaQoNKBjlxH6yku56oZrc739Jab?=
 =?us-ascii?Q?6UyC/gXK0I/HwkZRf/iW+qoiNyy//Vo4+4coNILazsUtjjRzYJw/KSTMjgW+?=
 =?us-ascii?Q?fGtWghAQabHsIY1EhSh7MeIfUPYcf2wYzH1ShaWVCAEGjMSK/fZLSxz6TMD1?=
 =?us-ascii?Q?/EBoaDfWigkyEd4oHzmB/YrSkeS32y/Lnnd19K5mgpO5T8MSg5p1tPCpGZDj?=
 =?us-ascii?Q?HrgPnEsYHBE2MtHOk0yM2O6gfg9/ykapFA9diwdwjH8acoqLFdSBK1wUPaO6?=
 =?us-ascii?Q?k580gDFHs9NvSah0Apzrxra4fej+Kkk+Os9p+hrOGkr4LgmZ+a2Wg4cl+9tq?=
 =?us-ascii?Q?r/FNCyUlsIS9pRbiOWT8qxOwAujBPzTBk8Bu1b7HSRzdbADqpHl5eKyfvcgn?=
 =?us-ascii?Q?ke7esQUuZMLTLp4I8dqh34XlkygEhyNQ5bKe2XIxSfN3/P0IDWLarVuoGWXA?=
 =?us-ascii?Q?e0edWkVHJS8Oo9NgSfjhpzgRlgykxjWiASbLH+waOBd4az9MMF9M5VhrcO3r?=
 =?us-ascii?Q?l62tUQKNYXxyL5AL/ZhKAOmWX5tSeym7RQcLTXorYeK9r6RhFjATdUcDpnkW?=
 =?us-ascii?Q?MrqctH2koRMxM8NgptBegpenbl7EXqbyNQkn55Wd9TdMc1X3EVLjmO93J3en?=
 =?us-ascii?Q?P0IQUCPFFASzRF7GDeVzi1cErqD+1wAnAUS8FgjKuM86jokcC5cF/3C+6fAf?=
 =?us-ascii?Q?DJallkhbWUu0F3+vFkdesUkjPPUPud8nND9oocDBEsE7BYuQdlAcNmFkjj6i?=
 =?us-ascii?Q?yf5YO8iMD+SdCs9C9NGLvFKmaJxi1oqlMx7qfpMX/oZBZ1mKD9Y9puJqdEKz?=
 =?us-ascii?Q?HalpMDeWz+lOMMhQ7iGl6tAPnTisrjGuXBTU5E7jkd+QCbM+6/rWQqP1nSCz?=
 =?us-ascii?Q?RnXkzk3f5116zIwgx9P5Szr/mad9+Mp85i6YS/DyXgrHBPqI3xsmXvne1O5o?=
 =?us-ascii?Q?Xnzb8dWdlkGUjS7gCtkRksJquz+Y0ZDcxVWQWWd2SXduxJ51vyTbitmvNUlR?=
 =?us-ascii?Q?jrAX6zQlHWmn5qDNErHfmf8f2b20XoCpsbNRfpneTp62uug5VoAOYqoi9sAG?=
 =?us-ascii?Q?o9lHKgnpeMUbV+uJS3JLG5+IxXd1dV9xvoanV6Myo43NYDLdTGbZT5anVV2b?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebe4a22-2c8e-4af8-a396-08dbd0e15eef
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 20:24:18.3196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFZPEucdjN+yoKuctjymXfB/ZADARJLUKbN0RidllYNQ8a2pIheEdxMiM4V0QNKzL4qvVRkH4EELtpAc8zSf4w0Uqh/ImNFQ6Wl7Y7BBKl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8004
X-OriginatorOrg: intel.com

Alexey Kardashevskiy wrote:
[..]
> >>> +			       size_t count, enum tsm_data_select select)
> >>> +{
> >>> +	struct tsm_report_state *state = to_state(report);
> >>> +	const struct tsm_ops *ops;
> >>> +	ssize_t rc;
> >>> +
> >>> +	/* try to read from the existing report if present and valid... */
> >>> +	rc = read_cached_report(report, buf, count, select);
> >>> +	if (rc >= 0 || rc != -EWOULDBLOCK)
> >>> +		return rc;
> >>> +
> >>> +	/* slow path, report may need to be regenerated... */
> >>> +	guard(rwsem_write)(&tsm_rwsem);
> >>> +	ops = provider.ops;
> >>> +	if (!report->desc.inblob_len)
> >>> +		return -EINVAL;
> >>> +
> >>> +	/* did another thread already generate this report? */
> >>> +	if (report->outblob &&
> >>> +	    state->read_generation == state->write_generation)
> >>> +		goto out;
> >>> +	kvfree(report->outblob);
> >>> +	kvfree(report->auxblob);
> >>> +	report->outblob = NULL;
> >>> +	report->auxblob = NULL;
> >>> +	rc = ops->report_new(report, provider.data);
> >>
> >>
> >> Drop @ops and use "provider.ops" here?
> > 
> > Shrug, ok.
> 
> I asked as at first I thought it is stored right after rwsem_write in 
> @ops for a reason but then it was not even checked for NULL so it could 
> be initialized where declared.

I went back to declaring an @ops variable because this sequence needs to
validate that the ops are non-NULL under the lock, and typing
provider.ops several times is a bit grating.

        /* slow path, report may need to be regenerated... */
        guard(rwsem_write)(&tsm_rwsem);
        ops = provider.ops;
        if (!ops)
                return -ENOTTY;
