Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445EA3A278
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 21:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3va8pns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697059844; x=1728595844;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OMg9CDfoIQbtet5N75O++QhNUJArlMLeCCUJGoIpgRQ=;
  b=B3va8pnsO84Fspd0YXTD8VyidnFl8rf7ixCEkJCk4Zv6B2cYaBTeoVDM
   RW51RKbWaoZqMdrz7fum8hgoxzaPCoqcEq0mrsPC9ul0dLApWCBeTH0k8
   3Mla7Bz0w7SM4uAdL2da8zAr7FEZTH3zvF1IA0k0RHXW38G45uKp3F/hr
   og6Nm1kOeBcp3nU8jdm/g2RfxlBLgCmi5fBFcjDbDS8gvHnOfAsA3m7lO
   G3i3BqZ+RbZFWHXFoVWPsAIgTdc9Ikf/kT+Uu5l/aK7BpsEtXfSHOknFP
   0yCFGs/UHII9cKv0x7BympGhODFDpqzcJfsHXoTSmzu+Mgks52N8P4APc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364136777"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="364136777"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 14:30:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747611403"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="747611403"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Oct 2023 14:30:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 14:30:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 14:30:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 14:30:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fl5j1Rx6hdchuhXsKnk8UeH7ijcxKO5R9qsLMkR+LGMR7NAp6gqfqfE0c5+anLKoUVy1SU90G2MEwEL+ti9kPfkuBPK1Nyavw8aryiJpHSFBkMqPfU3wijbpeI7kdanFoJBqY7yLWDckSFxPN+dcbK36SWx+duUKI5zIWLneJAiKggV2oYjv7euHEw5SWY48ysPlZJZJorVTBeIF+TnuceozOyFcfwXrX6qcYSsgeVme9xLYT6Tl0RjHiley3JhxaZVCv1q9PF+CxSqy+pilc2DJotXw8vVxGAZ5FSfaIR5ww9Ku3VwSef2DxwVQcK6tKB5YW+avsAFmUF9rvDMdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtnwBXbHofU6Hjc2G1Di5TCNC1oLIudVn1V1E5RphdU=;
 b=OjzVXvn807Aww3lFMpsdZQDjkM3FgfWDxIYsAjaOATOaW28t6WU0OzvT9SbvVHwTCKO2aTncySo/DjJ7OW2V1nt+QdxnPWGG/NuiEbl0wTXtP3jjaIJW7C8LmYSJ58R7/CGylTy4fXDSSIfSBau1lR+gay/PVuRbgljlGHTxIErQrB0QY9xQFE5pjif6cY/1cntfFmy+kbtxOhTTV8s69n8XBI01RgF5DpFc7aFUcSN3+m9Xo05pvSCyIYpoZNrjnaXJfFPHAA4dwXpNWx/OnG8Gd3FmTopFyWZlorFNnCUZFKH3MUpbcSrYR1eSKHE5XtGv8N/QCTEh93Uwu24RSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DS0PR11MB7970.namprd11.prod.outlook.com (2603:10b6:8:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 21:30:33 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::acb0:6bd3:58a:c992]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::acb0:6bd3:58a:c992%5]) with mapi id 15.20.6838.040; Wed, 11 Oct 2023
 21:30:33 +0000
Date: Wed, 11 Oct 2023 14:30:30 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, Dan Williams
	<dan.j.williams@intel.com>, <linux-coco@lists.linux.dev>
CC: Borislav Petkov <bp@alien8.de>, Dionna Glaze <dionnaglaze@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>, Jeremi Piotrowski
	<jpiotrowski@linux.microsoft.com>, <peterz@infradead.org>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v5 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Message-ID: <652713f6d5bac_780ef294b9@dwillia2-xfh.jf.intel.com.notmuch>
References: <169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com>
 <169700206636.779347.12625001287120171667.stgit@dwillia2-xfh.jf.intel.com>
 <9b8d2905-3203-67bc-9d6b-b60023910666@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9b8d2905-3203-67bc-9d6b-b60023910666@amd.com>
X-ClientProxiedBy: MW2PR16CA0060.namprd16.prod.outlook.com
 (2603:10b6:907:1::37) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DS0PR11MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d5c422-d357-498a-d7ef-08dbcaa14d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: owggKS2ooUg9zwKyd8vKLWGGvXwvXC3dNkO1Yzmmjtfd0ANLQsXgqEbQAemgCk6qYRA6+UXSqqir/6fKVvXA1L/okgvFeZb4h/kFHCKwF7HpcSw3xi97Kkm6Epd3rYDO+ImN5K0M1qKb5xA00HPsZtGoRCVlCijgIEyx9+aZTvNwHIm67nnip2KBKTmhc3mRK08QTK7BQkgXmGOtcxTI/SHORhR36AXV/OfYAhboK18IYayiEiwtj8IzzznyjHJp2cjka6/oq2OReeyX7bfWGKq0Af5W7axQDmU79nVDdbN7oQH/f7qkG3P2YMctsp7qpR40+sqJZXu66b1ufQbt8mr3BDVbGekh0sW1K7Q1Fw006RdBkUVwVAAOZrkUHv9cmZ6rBE7MWiSWQguRwjXzn4pe0Pdzy4MoLdsLDiG/SCp7zhsc3Wh1YX5Md5WwYKovEl4wDWYNH8WDrB+wrEgznohQ1V2qOOiJl9ilazMgO90GnJzRCvuUJ5Z/FG6Ln0710c2377/MyJbR1BQzZQPg6F6oUd+YEdCd4ucKOksUFN8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(346002)(396003)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(53546011)(9686003)(6486002)(478600001)(966005)(8936002)(6506007)(66556008)(83380400001)(2906002)(54906003)(5660300002)(110136005)(66476007)(66946007)(316002)(8676002)(26005)(41300700001)(4326008)(82960400001)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LT8qlx2QQ7yJjSGSKW0KfRit8LZ9PEpGEwoAU0QWHyFSt3aQZqJf+qV8zJBM?=
 =?us-ascii?Q?/R9Es9zGHtUfy6Z9ij8t/NiLphPaoGR9LP43MXuvPZG7s21zfZavh2T2orx0?=
 =?us-ascii?Q?Y/7nWuGSW7qprDcyXrz5YxEGdRwATgOj60lMQghbsDWX6o0eSzF+hMBl+sAN?=
 =?us-ascii?Q?7LnA58+3NifIs/j9pFBb/OM5eiAI3HfbDU7RJo5rlOcqq2mK6Kfu6Ir9hHxo?=
 =?us-ascii?Q?cg1lNlkU9x5W1tOtvjPeOvCOSqO9ZfWAgmst7zRxNHqfZZBD/wyHFiB4ReN7?=
 =?us-ascii?Q?hOtup9VQU1Aee4oQ/3FzeH42+qR/qb95FMfQQArRr/cK75uTGGR2oDzQJOVy?=
 =?us-ascii?Q?jk/FgiXFHXDlVzjqr8zLVn+6IxutOth9ozL6oU3cjYOud29zlmpCvvSoSstw?=
 =?us-ascii?Q?Ft+1lkc8SvJGegfyqv/0IF7LiMJiz1Go2msLToYeqCUu+m1B89ISKjifTfxb?=
 =?us-ascii?Q?626VhwD3OC8jcARgZssXVjydwDmZofwc3Tv4KhUVCu/YtgLOtZdasAl1T7z5?=
 =?us-ascii?Q?46J8QEwRt7hcQlDQhCmnVuMOunWV3lpkxwBTIAAD8Zjjl6WzbTbETZqDwhR9?=
 =?us-ascii?Q?xJI2z5cYYfKjSCPHiesD7QoiktSbdzvvejbLZ7DziCuI2cyf5y10d0SX/WGw?=
 =?us-ascii?Q?4Mwaklbmn318tN0nd8rOIsGnis12Ze75+pL5T21AKfoviaF6TlVUvlL14cBD?=
 =?us-ascii?Q?mPT25PVJ0XBohPKoYY3egZpELIPwZzR5fI309K2hx6uqS7XLvn+GWCKYSh0W?=
 =?us-ascii?Q?TTosd8EACBflN67wKvfjYqP0ZbJi980NrILD2JiaNg5uds0UOahLj9ZCyfH1?=
 =?us-ascii?Q?32czP7E9uK4uMZzwt49zdadL8B/+UPV306tD+Ac6aPy9/ZHcCgxHhLFzaxoH?=
 =?us-ascii?Q?tvZAzcyGVdG4x0pJ9MEdajUoxWtKYe25OLd0WLVsk2FtJbHUzwt3tbI1eGWY?=
 =?us-ascii?Q?y7jjovhTpHDIbjDuPQkMPJAOsbpSfmIGDgR2SbNl0BiVB6xrJmBkZy9B0ft1?=
 =?us-ascii?Q?VKhSoN2CKjbwC5Pr1Ch1bW/5MH22YUUWyYErSFipSI/SpRi2uq8MFMTMEY9B?=
 =?us-ascii?Q?+yXJ3dq1sfrHMrK4MfFyWMCoBwMuIMnVJCmOntyTGZloBc+bY5QBO0mEb1X0?=
 =?us-ascii?Q?nuGBK3WNOYvP1WNskkskDTeR0I+sbgJbrtJ2LflEBr+ZfY9BRISBobw3hNiK?=
 =?us-ascii?Q?uPcMErwhfz9W++/vxO/2EjVO/BHd+9XiTkbmsoWf/O9kwT0JbQJe0NgsvI1D?=
 =?us-ascii?Q?ArruACx62bqIvo9n40kToym+x9crixz2lw9XIMHkVmJnxyCWiHV1XGfW0bhr?=
 =?us-ascii?Q?v/rlhAzf8Xr5EMhM+wkrTz4B1SLvAm/yPUU+xU3ktFSLohV7Pk/rI9BWzR56?=
 =?us-ascii?Q?fgyCMDhSqMmKWBCtdkQzWQeljDYUiVVAS15FnDxC9msCWtpymbt7h1CgTTuA?=
 =?us-ascii?Q?XyT2/X9+LlKSxz50YzZIPnIe3hMeAHw2//nUl8jp6xb4uNtN1j7tRgwLWFt3?=
 =?us-ascii?Q?eH8gLV8IGZF0u6/oVLcDyfKfEqwUtbCB18aSPNOTpv+339JPeTZn470y+vC7?=
 =?us-ascii?Q?SdvfuRQIoaKIjZYwsGG/PNiyx918byObPg7GdDeajZcH3JoencY38m4URW4l?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d5c422-d357-498a-d7ef-08dbcaa14d1b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 21:30:33.7303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqa90tEMQ5hTL/ISduLfWjjNzf3I7ekrmplyA3aZQkKkOutkFj1khsLSHAufBbv5OnEoFF0YK8tkMQS2SFDXDPjWzgmyBxN9+6fYbhIdhhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7970
X-OriginatorOrg: intel.com

Tom Lendacky wrote:
> On 10/11/23 00:27, Dan Williams wrote:
> > The sevguest driver was a first mover in the confidential computing
> > space. As a first mover that afforded some leeway to build the driver
> > without concern for common infrastructure.
> > 
> > Now that sevguest is no longer a singleton [1] the common operation of
> > building and transmitting attestation report blobs can / should be made
> > common. In this model the so called "TSM-provider" implementations can
> > share a common envelope ABI even if the contents of that envelope remain
> > vendor-specific. When / if the industry agrees on an attestation record
> > format, that definition can also fit in the same ABI. In the meantime
> > the kernel's maintenance burden is reduced and collaboration on the
> > commons is increased.
> > 
> > Convert sevguest to use CONFIG_TSM_REPORTS to retrieve the data that
> > the SNP_GET_EXT_REPORT ioctl produces. An example flow follows for
> > retrieving the report blob via the TSM interface utility,
> > assuming no nonce and VMPL==2:
> > 
> >      report=/sys/kernel/config/tsm/report/report0
> >      mkdir $report
> >      echo 2 > $report/privlevel
> >      dd if=/dev/urandom bs=64 count=1 > $report/inblob
> >      hexdump -C $report/outblob
> >      cat $report/certs
> >      rmdir $report
> > 
> > Given that the platform implementation is free to return empty
> > certificate data if none is available it lets configfs-tsm be simplified
> > as it only needs to worry about wrapping SNP_GET_EXT_REPORT, and leave
> > SNP_GET_REPORT alone.
> > 
> > The old ioctls can be lazily deprecated, the main motivation of this
> > effort is to stop the proliferation of new ioctls, and to increase
> > cross-vendor collaboration.
> > 
> > Link: http://lore.kernel.org/r/64961c3baf8ce_142af829436@dwillia2-xfh.jf.intel.com.notmuch [1]
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Tom Lendacky <thomas.lendacky@amd.com>
> > Cc: Dionna Glaze <dionnaglaze@google.com>
> > Cc: Brijesh Singh <brijesh.singh@amd.com>
> > Cc: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > ---
> >   drivers/virt/coco/sev-guest/Kconfig     |    1
> >   drivers/virt/coco/sev-guest/sev-guest.c |  139 +++++++++++++++++++++++++++++++
> >   2 files changed, 140 insertions(+)
> > 
> > diff --git a/drivers/virt/coco/sev-guest/Kconfig b/drivers/virt/coco/sev-guest/Kconfig
> > index da2d7ca531f0..1cffc72c41cb 100644
> > --- a/drivers/virt/coco/sev-guest/Kconfig
> > +++ b/drivers/virt/coco/sev-guest/Kconfig
> > @@ -5,6 +5,7 @@ config SEV_GUEST
> >   	select CRYPTO
> >   	select CRYPTO_AEAD2
> >   	select CRYPTO_GCM
> > +	select TSM_REPORTS
> >   	help
> >   	  SEV-SNP firmware provides the guest a mechanism to communicate with
> >   	  the PSP without risk from a malicious hypervisor who wishes to read,
> > diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
> > index e5f8f115f4af..7fdc5a774eab 100644
> > --- a/drivers/virt/coco/sev-guest/sev-guest.c
> > +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> > @@ -16,10 +16,12 @@
> >   #include <linux/miscdevice.h>
> >   #include <linux/set_memory.h>
> >   #include <linux/fs.h>
> > +#include <linux/tsm.h>
> >   #include <crypto/aead.h>
> >   #include <linux/scatterlist.h>
> >   #include <linux/psp-sev.h>
> >   #include <linux/sockptr.h>
> > +#include <linux/cleanup.h>
> >   #include <uapi/linux/sev-guest.h>
> >   #include <uapi/linux/psp-sev.h>
> >   
> > @@ -768,6 +770,135 @@ static u8 *get_vmpck(int id, struct snp_secrets_page_layout *layout, u32 **seqno
> >   	return key;
> >   }
> >   
> > +struct snp_msg_report_resp_hdr {
> > +	u32 status;
> > +	u32 report_size;
> > +	u8 rsvd[24];
> > +};
> > +#define SNP_REPORT_INVALID_PARAM 0x16
> > +#define SNP_REPORT_INVALID_KEY_SEL 0x27
> > +
> > +struct snp_msg_cert_entry {
> > +	unsigned char guid[16];
> > +	u32 offset;
> > +	u32 length;
> > +};
> > +
> > +static int sev_report_new(struct tsm_report *report, void *data)
> > +{
> > +	static const struct snp_msg_cert_entry zero_ent = { 0 };
> > +	int certs_size = 0, cert_count, i, offset;
> > +	struct tsm_desc *desc = &report->desc;
> > +	struct snp_guest_dev *snp_dev = data;
> > +	struct snp_msg_report_resp_hdr hdr;
> > +	const int report_size = SZ_4K;
> > +	const int ext_size = SZ_16K;
> > +	int ret, size = report_size + ext_size;
> > +	u8 *certs_address;
> > +
> > +	if (desc->inblob_len != 64)
> > +		return -EINVAL;
> > +
> > +	void *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
> > +	if (!buf)
> > +		return -ENOMEM;
> > +
> > +	guard(mutex)(&snp_cmd_mutex);
> > +
> > +	/* Check if the VMPCK is not empty */
> > +	if (is_vmpck_empty(snp_dev)) {
> > +		dev_err_ratelimited(snp_dev->dev, "VMPCK is disabled\n");
> > +		mutex_unlock(&snp_cmd_mutex);
> 
> Is this needed given the guard above?
> 
> > +		return -ENOTTY;
> > +	}
> > +
> > +	certs_address = buf + report_size;
> > +	struct snp_ext_report_req ext_req = {
> > +		.data = { .vmpl = desc->privlevel },
> > +		.certs_address = (__u64)certs_address,
> > +		.certs_len = ext_size,
> > +	};
> > +	memcpy(&ext_req.data.user_data, desc->inblob, desc->inblob_len);
> > +
> > +	struct snp_guest_request_ioctl input = {
> > +		.msg_version = 1,
> > +		.req_data = (__u64)&ext_req,
> > +		.resp_data = (__u64)buf,
> > +		.exitinfo2 = 0xff,
> > +	};
> > +	struct snp_req_resp io = {
> > +		.req_data = KERNEL_SOCKPTR(&ext_req),
> > +		.resp_data = KERNEL_SOCKPTR(buf),
> > +	};
> > +
> > +	ret = get_ext_report(snp_dev, &input, &io);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	memcpy(&hdr, buf, sizeof(hdr));
> > +	if (hdr.status == SNP_REPORT_INVALID_PARAM)
> > +		return -EINVAL;
> > +	if (hdr.status == SNP_REPORT_INVALID_KEY_SEL)
> > +		return -EINVAL;
> > +	if (hdr.status)
> > +		return -ENXIO;
> > +	if ((hdr.report_size + sizeof(hdr)) > report_size)
> > +		return -ENOMEM;
> > +
> > +	void *rbuf __free(kvfree) = kvzalloc(hdr.report_size, GFP_KERNEL);
> > +	if (!rbuf)
> > +		return -ENOMEM;
> > +
> > +	memcpy(rbuf, buf + sizeof(hdr), hdr.report_size);
> > +	report->outblob = no_free_ptr(rbuf);
> > +	report->outblob_len = hdr.report_size;
> > +
> > +	for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i++) {
> > +		struct snp_msg_cert_entry *certs = buf + report_size;
> > +
> > +		if (memcmp(&certs[i], &zero_ent, sizeof(zero_ent)) == 0)
> > +			break;
> > +		certs_size += certs[i].length;
> > +	}
> > +	cert_count = i;
> > +
> > +	/* No certs to report */
> > +	if (cert_count == 0)
> > +		return 0;
> > +
> > +	/* sanity check that the entire certs table with metadata fits */
> > +	if ((cert_count + 1) * sizeof(zero_ent) + certs_size > ext_size)
> > +		return -ENXIO;
> > +
> > +	void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
> > +	if (!cbuf)
> > +		return -ENOMEM;
> > +
> > +	/* Concatenate returned certs */
> > +	for (i = 0, offset = 0; i < cert_count; i++) {
> > +		struct snp_msg_cert_entry *certs = buf + report_size;
> > +
> > +		memcpy(cbuf + offset, certs_address + certs[i].offset, certs[i].length);
> > +		offset += certs[i].length;
> > +	}
> 
> I agree with Dionna here, you must keep the GUID<-->Cert relationship 
> here. I think you can just copy the full returned cert buffer into the 
> destination buffer. Then it would look just like what the ioctl() returns 
> and make it easier for userspace programs to switch to the new mechanism.

This reverses the feedback from Jeremi where he asked for a separate
"certs" file.

Hmm, perhaps this should be an optional @auxblob attribute where a
backend can publish supplemental data to the report. The issue from a
common ABI perspective is that the SNP report format is independent of
the conveyed certificates and the TDX quote format includes a reference
to the "certs" from the "reportblob". In the SNP case that certs
reference is conveyed in the ioctl envelope which does not exist in the
configfs-tsm case.

So the proposal is @auxblob is documented as supplemental data to the
report, and then when @provider indicates "sev-guest" the format of
@auxblob is defined by 'struct cert_table' in GHCB 4.1.8.1
MSG_REPORT_REQ.

In the @provider == "tdx-guest" case the @auxblob attribute is hidden,
or empty.
