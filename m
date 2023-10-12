Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CF462A
	for <linux-coco@lists.linux.dev>; Thu, 12 Oct 2023 00:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gm3ZzzF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697071166; x=1728607166;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/p0zy4l1yjwREP9217DAdknOH9p/xn9W0kqUDppk/AE=;
  b=gm3ZzzF1qBkncL7sdeDtFU+cK2DBWdm8qjWSVq9Yl6v5hCwE2yI8yczA
   YTUUzz8+OKleJDDxz43lUWHLDb62LilkZUdntUYBOT+k5i6lqH1UCymlx
   OV+Fg83Av+PxpTZVjAI18MM0BDZNGpJZvi1o6Mt3jEePFlzZrsdEnNDyL
   zFXO0WcfS/ugtT6NCzjAd9+ANpq7CPOwM87mdu2rwm2teLeAfuWUa+Ucq
   0x3ybZqaxV0K9nRl20n4w0IYXJLSkLUf6jfWFcW9t5lDibnUxsmy8ZTIP
   CZHWy52N4v7DheBzaf5a73+MGwkHlZoDd/ke0lQ6OLWL0dv9z5hQAF9Es
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451296092"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="451296092"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 17:39:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747674141"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="747674141"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Oct 2023 17:39:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 17:39:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 17:39:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 17:39:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K59wLA9Sa5tV58b1sqQ25gvbdh/AIbp6z57CzlFVEgQNszmcsGGPtmk0h0r3uOb09+ovF/L3lJmGhlK/D0Afm8rX0TfjMLk84eKllXHEnVG+F4Ogd+tT3l62mbM58jmaY/aIbP7fkuxnvSOuFgr/vAiJGUwpfbhWTVpetnxnBQjlkElLqVpo+WpZ+qd9Wfo8arOjP2S60iO0B8p37SgYw/9r9Dg1RxPOOc9RNQgbCGtTubdsONAnpMgVECeU2g/aQ3QbjsSPo4Iz89xSVaKubD/bH+t7KDqVsF/a//oVuJnMYqadC7JxZlzZJ2eGEr79U5T++RkU+6kYtsgE75dsAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dJWi2KbKnrjsvX0vHdevwPxsL2bxSy1QhZ7MCdEAWw=;
 b=JEqiVyWgelMLvlyGyV4yddk9/5uoHZst1HlCbJXIm2sWAK6692lHmljNWqPBdxB6h0VhWP1QUJC4b+wcVxczOze3245A2N20eRYBlNfL3EnXev7zuOmcWGEMpzYbpUzzIsmN1zTfR0fz6xgWaU2RUuJApcMJ1TWk6KkM0Z32rpUY2DODEkr962lITjcC6ROE0d3FxSZ753+r3Ey8vv85jjdk8kitidyWiY+vxnJX2MTKTJD+8mHDMAbBKHs8gVD+S3qOEodBPmyhnkvm6yeXAxjMyYCBBtPX3uQ0eKem9Mf5Io4lO/G6KRuCDmex5CLi2Dd6Yu7ZEPzwG4jL/Vfh4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CYYPR11MB8331.namprd11.prod.outlook.com (2603:10b6:930:bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Thu, 12 Oct
 2023 00:39:02 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::acb0:6bd3:58a:c992]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::acb0:6bd3:58a:c992%5]) with mapi id 15.20.6838.040; Thu, 12 Oct 2023
 00:39:01 +0000
Date: Wed, 11 Oct 2023 17:38:58 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, Dan Williams
	<dan.j.williams@intel.com>, <linux-coco@lists.linux.dev>
CC: Borislav Petkov <bp@alien8.de>, Dionna Glaze <dionnaglaze@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>, Jeremi Piotrowski
	<jpiotrowski@linux.microsoft.com>, <peterz@infradead.org>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v5 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Message-ID: <6527402239952_780ef294cd@dwillia2-xfh.jf.intel.com.notmuch>
References: <169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com>
 <169700206636.779347.12625001287120171667.stgit@dwillia2-xfh.jf.intel.com>
 <9b8d2905-3203-67bc-9d6b-b60023910666@amd.com>
 <652713f6d5bac_780ef294b9@dwillia2-xfh.jf.intel.com.notmuch>
 <9b08e4f0-9538-3680-2465-1b200ff0d777@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9b08e4f0-9538-3680-2465-1b200ff0d777@amd.com>
X-ClientProxiedBy: MW4PR04CA0113.namprd04.prod.outlook.com
 (2603:10b6:303:83::28) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CYYPR11MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 136f3b7e-6e38-4b22-5aa4-08dbcabba098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oPEajQaed4M0xBh9Lbz5NeJ6HnPJww8Ngy8BrN0iov6j7vuNJ7e2ND7EHa+V90JeyA9dddAnVwhYZC8tNdb93cJu9yIZ9gELQugd7K4PdaslpQSjd3t9Q28+S5qqWEo7C78NKCItOVd3oyZ5mHk+bQco0cBdrl9GTH4IWiWHIP5Y6MfycAzFGe6BZouTBkubdqoEY0Otla0oChM39v6hGnYHmh7858nng2W8KvfLE54lVACkTjnvCHfEqSBItIiC/S2mPmOOgtBbwGEILUls8AL3fSRnIs9U1tVw7R2IjYBjufPkfHK3V7Z7qMRmclVBNOYpobKR18Sx8iXTITLc7KTX/B+aZ0f/xsleYQMa1HJ95C0sc1JkROv2DITOzb6vJbnXxVFJ7/XLwCSriUEq7e+HCi5u6h2dzpSEdkApeM77HuTZU5PLcJWbxIbgeIFFmkvCHWSiGVfR5JlBgUM7FpSuEe5m0XtlxrTVjhDxdF5ItoF4Q+bPNM72iPvZ39ys9QOjmI9MLJskx+c9ljDn3UDl9t3S1qA6zFgPjemqPG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(366004)(346002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(86362001)(966005)(8676002)(2906002)(8936002)(6486002)(30864003)(478600001)(4326008)(5660300002)(83380400001)(26005)(41300700001)(9686003)(6512007)(316002)(6506007)(82960400001)(53546011)(66946007)(66556008)(66476007)(110136005)(54906003)(6666004)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FVvFKGWsiWkfRDmcZdDleqOFDxodbzZ9CmGTd4scWNiODGhHRv3cN7kF/gCT?=
 =?us-ascii?Q?aKt4l7jSCbIjx3fEFcTYTBb1iqCc23nf6I9J3Tyibwi188dktfSq4MiPx1DS?=
 =?us-ascii?Q?QPWrh0LeGXFU6GdQNzffrjPb8JLW4xOsFy3Iss3Zt7SWspPgoqvsnvruyZsE?=
 =?us-ascii?Q?fpmnwY3tGsCHV0oIb0KoRJ7rlm/hs5pPVPVZDdd2Iuv/Z09T/ZyeIudadJsK?=
 =?us-ascii?Q?PkUUJj2KmBhmOnKz5OwK2Rhz01HuOhZgjx6GxJyMN36/5AINpE6G9gxmy0BA?=
 =?us-ascii?Q?HyjU4CFVah6BtwYfnU7bvI69e7EQeKEt9kv1GfREfcEBb1VtI4O26dGRjvT+?=
 =?us-ascii?Q?mVlkfRzZd1uPKRCRSqN0TvapC4oxfxtYt49WgCmdrCQQcyVntEjy3JaI6nQe?=
 =?us-ascii?Q?DqbeKmDYeR1TMaA89E83oxzjHYgkvmmPMpzaUcVMDgt/imyC/wiSp8dWLrKA?=
 =?us-ascii?Q?CgBOOQl1oXTEtmNJSftW5OESnXh2ui0rhTP48QL4Jk2YosAk/ghJpV0TwVx9?=
 =?us-ascii?Q?lfSHsEqjpUuFC/1qFsEAdcWH2h4pk1qTLzzwNaKY/JOfzqtgrITHatHIuBTb?=
 =?us-ascii?Q?cncVkzD5rjaY8CrSSXu+lCsjjlOWzwP8D9IvQfmAEnnqJ9PNT7vYEclzz/n0?=
 =?us-ascii?Q?ov+JzbpwXDw2vlEpb0qfQA+lmCxQPLph3H1JWaN61aWUmpUGGM0V/m2Jh0U+?=
 =?us-ascii?Q?9Rj6CTjx35UiWRRY/pUMSkRfEKMStdJUmqgc0zA46zzVWj2bQQkB5Q5Dv32J?=
 =?us-ascii?Q?AqqVifUI15urVuM7+VxkBl92YISOAXWiT8HvaROatA6XGynWl2HdpDn88DyV?=
 =?us-ascii?Q?SEPJtnXuBDhfULB81v2HWYaxtx2fq1vckao81le9YyqIxfyQELJOvpRPqFn6?=
 =?us-ascii?Q?9fIw3BMSBELbU0e0qQ4GhwJ2zwZM+ul+DRlDuJo40uimMaDjRyfM+PKrbdYC?=
 =?us-ascii?Q?+AYVNkxgQIYy5fz/Ze45pC7ZqG2ptBBkkeoX1rTzr2VlnKnQQ3r3K3/DiS2M?=
 =?us-ascii?Q?jzRvX4wMv2IgbZDBAj2QiXjFlotHTXw13hDg+3+AmGSRmmdFSJhTUmbEmFml?=
 =?us-ascii?Q?0HMP8xP1EG9FzykIJLkTWyNsIUVXJgIDz/RFw97IdzYOjmolehSuk+ObLBDe?=
 =?us-ascii?Q?TU+NiWcMhBJRPirzuk8xXU/PQjX9+YOkATMZaeUKXGvQCGgZPUc7JtKJWM3A?=
 =?us-ascii?Q?hRpf9Y0pml4Csgs/CbqbCoTBgnxtQkhgP/uYttcboZ/jKFB9I2JqGIpvue+8?=
 =?us-ascii?Q?au/7sl9qo9DMsDN99lTb5fwcEcIecpZKjzRJ/OaXsI5YF3YMIljlJ84HDfJN?=
 =?us-ascii?Q?dXp2yQmM70WPLdGJIXYW7Q5meGSxoHEEGCTHipN+bZoxXLYl45/T2vqnLR/n?=
 =?us-ascii?Q?MDxbNJVMmpgfiXrJCcHUo7XOv2P8/dzcC5li4f02p/0KH2d4ri+LM+TXa2Rv?=
 =?us-ascii?Q?qw8GPxwtKFJeCADxkQRPKIJe8QeAm5u90NyvWmEFU/jwNj1Q6GCiPAU6Cg8Z?=
 =?us-ascii?Q?JuxEnJ/9QF9UQtwsaML8TN0Rz20mHxDTeXiYRCabawBXBK/rOg2fuV7Z8Qzk?=
 =?us-ascii?Q?i8sPkIZ3vVjSQajRFSJUTqABNk3tGWXTohVFYvoXIsxAJZ08I9pBEEsMOoXG?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 136f3b7e-6e38-4b22-5aa4-08dbcabba098
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 00:39:00.9369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: diNxf1scXjltbDgBnjY4lVtxFexPtDZWXQdAISFTdPq226A+6hbeHs/9WF2fQQceQFMAfP2atHNECZJ52qTjPRg6FbxfnkT4VHRaxwB1p1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8331
X-OriginatorOrg: intel.com

Tom Lendacky wrote:
> On 10/11/23 16:30, Dan Williams wrote:
> > Tom Lendacky wrote:
> >> On 10/11/23 00:27, Dan Williams wrote:
> >>> The sevguest driver was a first mover in the confidential computing
> >>> space. As a first mover that afforded some leeway to build the driver
> >>> without concern for common infrastructure.
> >>>
> >>> Now that sevguest is no longer a singleton [1] the common operation of
> >>> building and transmitting attestation report blobs can / should be made
> >>> common. In this model the so called "TSM-provider" implementations can
> >>> share a common envelope ABI even if the contents of that envelope remain
> >>> vendor-specific. When / if the industry agrees on an attestation record
> >>> format, that definition can also fit in the same ABI. In the meantime
> >>> the kernel's maintenance burden is reduced and collaboration on the
> >>> commons is increased.
> >>>
> >>> Convert sevguest to use CONFIG_TSM_REPORTS to retrieve the data that
> >>> the SNP_GET_EXT_REPORT ioctl produces. An example flow follows for
> >>> retrieving the report blob via the TSM interface utility,
> >>> assuming no nonce and VMPL==2:
> >>>
> >>>       report=/sys/kernel/config/tsm/report/report0
> >>>       mkdir $report
> >>>       echo 2 > $report/privlevel
> >>>       dd if=/dev/urandom bs=64 count=1 > $report/inblob
> >>>       hexdump -C $report/outblob
> >>>       cat $report/certs
> >>>       rmdir $report
> >>>
> >>> Given that the platform implementation is free to return empty
> >>> certificate data if none is available it lets configfs-tsm be simplified
> >>> as it only needs to worry about wrapping SNP_GET_EXT_REPORT, and leave
> >>> SNP_GET_REPORT alone.
> >>>
> >>> The old ioctls can be lazily deprecated, the main motivation of this
> >>> effort is to stop the proliferation of new ioctls, and to increase
> >>> cross-vendor collaboration.
> >>>
> >>> Link: http://lore.kernel.org/r/64961c3baf8ce_142af829436@dwillia2-xfh.jf.intel.com.notmuch [1]
> >>> Cc: Borislav Petkov <bp@alien8.de>
> >>> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> >>> Cc: Dionna Glaze <dionnaglaze@google.com>
> >>> Cc: Brijesh Singh <brijesh.singh@amd.com>
> >>> Cc: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
> >>> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> >>> ---
> >>>    drivers/virt/coco/sev-guest/Kconfig     |    1
> >>>    drivers/virt/coco/sev-guest/sev-guest.c |  139 +++++++++++++++++++++++++++++++
> >>>    2 files changed, 140 insertions(+)
> >>>
> >>> diff --git a/drivers/virt/coco/sev-guest/Kconfig b/drivers/virt/coco/sev-guest/Kconfig
> >>> index da2d7ca531f0..1cffc72c41cb 100644
> >>> --- a/drivers/virt/coco/sev-guest/Kconfig
> >>> +++ b/drivers/virt/coco/sev-guest/Kconfig
> >>> @@ -5,6 +5,7 @@ config SEV_GUEST
> >>>    	select CRYPTO
> >>>    	select CRYPTO_AEAD2
> >>>    	select CRYPTO_GCM
> >>> +	select TSM_REPORTS
> >>>    	help
> >>>    	  SEV-SNP firmware provides the guest a mechanism to communicate with
> >>>    	  the PSP without risk from a malicious hypervisor who wishes to read,
> >>> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
> >>> index e5f8f115f4af..7fdc5a774eab 100644
> >>> --- a/drivers/virt/coco/sev-guest/sev-guest.c
> >>> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> >>> @@ -16,10 +16,12 @@
> >>>    #include <linux/miscdevice.h>
> >>>    #include <linux/set_memory.h>
> >>>    #include <linux/fs.h>
> >>> +#include <linux/tsm.h>
> >>>    #include <crypto/aead.h>
> >>>    #include <linux/scatterlist.h>
> >>>    #include <linux/psp-sev.h>
> >>>    #include <linux/sockptr.h>
> >>> +#include <linux/cleanup.h>
> >>>    #include <uapi/linux/sev-guest.h>
> >>>    #include <uapi/linux/psp-sev.h>
> >>>    
> >>> @@ -768,6 +770,135 @@ static u8 *get_vmpck(int id, struct snp_secrets_page_layout *layout, u32 **seqno
> >>>    	return key;
> >>>    }
> >>>    
> >>> +struct snp_msg_report_resp_hdr {
> >>> +	u32 status;
> >>> +	u32 report_size;
> >>> +	u8 rsvd[24];
> >>> +};
> >>> +#define SNP_REPORT_INVALID_PARAM 0x16
> >>> +#define SNP_REPORT_INVALID_KEY_SEL 0x27
> >>> +
> >>> +struct snp_msg_cert_entry {
> >>> +	unsigned char guid[16];
> >>> +	u32 offset;
> >>> +	u32 length;
> >>> +};
> >>> +
> >>> +static int sev_report_new(struct tsm_report *report, void *data)
> >>> +{
> >>> +	static const struct snp_msg_cert_entry zero_ent = { 0 };
> >>> +	int certs_size = 0, cert_count, i, offset;
> >>> +	struct tsm_desc *desc = &report->desc;
> >>> +	struct snp_guest_dev *snp_dev = data;
> >>> +	struct snp_msg_report_resp_hdr hdr;
> >>> +	const int report_size = SZ_4K;
> >>> +	const int ext_size = SZ_16K;
> >>> +	int ret, size = report_size + ext_size;
> >>> +	u8 *certs_address;
> >>> +
> >>> +	if (desc->inblob_len != 64)
> >>> +		return -EINVAL;
> >>> +
> >>> +	void *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
> >>> +	if (!buf)
> >>> +		return -ENOMEM;
> >>> +
> >>> +	guard(mutex)(&snp_cmd_mutex);
> >>> +
> >>> +	/* Check if the VMPCK is not empty */
> >>> +	if (is_vmpck_empty(snp_dev)) {
> >>> +		dev_err_ratelimited(snp_dev->dev, "VMPCK is disabled\n");
> >>> +		mutex_unlock(&snp_cmd_mutex);
> >>
> >> Is this needed given the guard above?
> >>
> >>> +		return -ENOTTY;
> >>> +	}
> >>> +
> >>> +	certs_address = buf + report_size;
> >>> +	struct snp_ext_report_req ext_req = {
> >>> +		.data = { .vmpl = desc->privlevel },
> >>> +		.certs_address = (__u64)certs_address,
> >>> +		.certs_len = ext_size,
> >>> +	};
> >>> +	memcpy(&ext_req.data.user_data, desc->inblob, desc->inblob_len);
> >>> +
> >>> +	struct snp_guest_request_ioctl input = {
> >>> +		.msg_version = 1,
> >>> +		.req_data = (__u64)&ext_req,
> >>> +		.resp_data = (__u64)buf,
> >>> +		.exitinfo2 = 0xff,
> >>> +	};
> >>> +	struct snp_req_resp io = {
> >>> +		.req_data = KERNEL_SOCKPTR(&ext_req),
> >>> +		.resp_data = KERNEL_SOCKPTR(buf),
> >>> +	};
> >>> +
> >>> +	ret = get_ext_report(snp_dev, &input, &io);
> >>> +
> >>> +	if (ret)
> >>> +		return ret;
> >>> +
> >>> +	memcpy(&hdr, buf, sizeof(hdr));
> >>> +	if (hdr.status == SNP_REPORT_INVALID_PARAM)
> >>> +		return -EINVAL;
> >>> +	if (hdr.status == SNP_REPORT_INVALID_KEY_SEL)
> >>> +		return -EINVAL;
> >>> +	if (hdr.status)
> >>> +		return -ENXIO;
> >>> +	if ((hdr.report_size + sizeof(hdr)) > report_size)
> >>> +		return -ENOMEM;
> >>> +
> >>> +	void *rbuf __free(kvfree) = kvzalloc(hdr.report_size, GFP_KERNEL);
> >>> +	if (!rbuf)
> >>> +		return -ENOMEM;
> >>> +
> >>> +	memcpy(rbuf, buf + sizeof(hdr), hdr.report_size);
> >>> +	report->outblob = no_free_ptr(rbuf);
> >>> +	report->outblob_len = hdr.report_size;
> >>> +
> >>> +	for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i++) {
> >>> +		struct snp_msg_cert_entry *certs = buf + report_size;
> >>> +
> >>> +		if (memcmp(&certs[i], &zero_ent, sizeof(zero_ent)) == 0)
> >>> +			break;
> >>> +		certs_size += certs[i].length;
> >>> +	}
> >>> +	cert_count = i;
> >>> +
> >>> +	/* No certs to report */
> >>> +	if (cert_count == 0)
> >>> +		return 0;
> >>> +
> >>> +	/* sanity check that the entire certs table with metadata fits */
> >>> +	if ((cert_count + 1) * sizeof(zero_ent) + certs_size > ext_size)
> >>> +		return -ENXIO;
> >>> +
> >>> +	void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
> >>> +	if (!cbuf)
> >>> +		return -ENOMEM;
> >>> +
> >>> +	/* Concatenate returned certs */
> >>> +	for (i = 0, offset = 0; i < cert_count; i++) {
> >>> +		struct snp_msg_cert_entry *certs = buf + report_size;
> >>> +
> >>> +		memcpy(cbuf + offset, certs_address + certs[i].offset, certs[i].length);
> >>> +		offset += certs[i].length;
> >>> +	}
> >>
> >> I agree with Dionna here, you must keep the GUID<-->Cert relationship
> >> here. I think you can just copy the full returned cert buffer into the
> >> destination buffer. Then it would look just like what the ioctl() returns
> >> and make it easier for userspace programs to switch to the new mechanism.
> > 
> > This reverses the feedback from Jeremi where he asked for a separate
> > "certs" file.
> 
> I'm not sure I follow, you would still have a separate certs file. It 
> would contain the GUID table followed by the certs data and would be 
> separate from the attestation report. You would be replacing the 
> "Concatenate returned certs" loop with a straight memcpy. If you want to 
> truncate the size to the actual data size, then you could go to the last 
> entry in the GUID table and use the offset and length to arrive at the 
> final size needed to be copied.

The issue is common ABI across vendors. TDX Quote does not have the
same "cert_table" scheme to convey this data. So that's why I arrived at
@auxblob to convey this "on the side" + "vendor format" data. I was
hoping that "concatenated PEM" was a point of commonality, but as Dionna
is pointing out these things are not quite the same.


> The current ioctl() has two requests, GET_REPORT and GET_EXT_REPORT. In 
> the case of the latter, a separate buffer is used to hold the returned 
> certs data (see struct snp_ext_report_req) and this would allow the data 
> from the certs file to be treated exactly the same as if returned via the 
> ioctl().

Right, that's what I would route to @auxblob.

> > Hmm, perhaps this should be an optional @auxblob attribute where a
> > backend can publish supplemental data to the report. The issue from a
> > common ABI perspective is that the SNP report format is independent of
> > the conveyed certificates and the TDX quote format includes a reference
> > to the "certs" from the "reportblob". In the SNP case that certs
> > reference is conveyed in the ioctl envelope which does not exist in the
> > configfs-tsm case.
> > 
> > So the proposal is @auxblob is documented as supplemental data to the
> > report, and then when @provider indicates "sev-guest" the format of
> > @auxblob is defined by 'struct cert_table' in GHCB 4.1.8.1
> > MSG_REPORT_REQ.
> 
> This will work, too. It allows the userspace to read and parse the data 
> just as if it had been returned via the ioctl(). And calling it auxblob 
> gives you the freedom to indicate that it is provider defined vs. certs 
> which might imply a certain format.

Ok, sounds good.
