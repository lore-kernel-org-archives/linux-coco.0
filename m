Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D088B1A5A2
	for <linux-coco@lists.linux.dev>; Wed, 20 Sep 2023 17:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695232377; x=1726768377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8I2IGkNC/baJK58DapJVr5UzrlSeyECeNh/uWrx8ZqU=;
  b=f7i2tWtDx3ln5L6sj/M1sRRLer5iy7ag4aiETpEsieYbYxsKp8oh/+AA
   g09AkCpEh8NYrvOoQfNlkvnIk4hbdK1UDRNuZv6jN+BRSqYUfXSd2Jv++
   J0qAePayDqYv9LInk74h4OHxpbPmBSrtvzaxlCZTcdNbxHF4kPTIKX6Wp
   9u9d1U+u2ecD4/H1LFwSLGd588MBFCs/gdseiH6iXLEeIyQ7C5onvWPn3
   Kpu1oBSMZZLGd3Gv3zBI37C3mjVtidE6G/luiMIwHGH9qX0J97X/af5f1
   eyghCxrmrEsshemy0FaRaG7ugBADKRsqdyeqmflfbwhfMrVr85jwQlJwC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359680542"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="359680542"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 10:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870465270"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="870465270"
Received: from zhijingf-mobl1.amr.corp.intel.com (HELO box.shutemov.name) ([10.251.218.227])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 10:52:51 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id EDF8A109E26; Wed, 20 Sep 2023 20:52:48 +0300 (+03)
Date: Wed, 20 Sep 2023 20:52:48 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	Wander Lairson Costa <wander@redhat.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Qinkun Bao <qinkun@apache.org>,
	Guorui Yu <GuoRui.Yu@linux.alibaba.com>, linux-coco@lists.linux.dev,
	x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] virt: tdx-guest: Add Quote generation support using
 TSM_REPORTS
Message-ID: <20230920175248.6foe67cwfe5oaa7u@box.shutemov.name>
References: <20230914031349.23516-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20230920131633.ig6ldmwavpu7uhss@box.shutemov.name>
 <0031e031-10a8-43b1-a29c-8e1cf913eaad@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0031e031-10a8-43b1-a29c-8e1cf913eaad@linux.intel.com>

On Wed, Sep 20, 2023 at 08:27:39AM -0700, Kuppuswamy Sathyanarayanan wrote:
> 
> 
> On 9/20/2023 6:16 AM, Kirill A . Shutemov wrote:
> >> +static u8 *tdx_report_new(const struct tsm_desc *desc, void *data, size_t *outblob_len)
> >> +{
> >> +	struct tdx_quote_buf *quote_buf = quote_data;
> >> +	int ret;
> >> +	u8 *buf;
> >> +	u64 err;
> >> +
> >> +	if (mutex_lock_interruptible(&quote_lock))
> >> +		return ERR_PTR(-EINTR);
> >> +
> >> +	/*
> >> +	 * If the previous request is timedout or interrupted, and the
> >> +	 * Quote buf status is still in GET_QUOTE_IN_FLIGHT (owned by
> >> +	 * VMM), don't permit any new request.
> >> +	 */
> >> +	if (quote_buf->status == GET_QUOTE_IN_FLIGHT) {
> >> +		ret = -EBUSY;
> >> +		goto done;
> >> +	}
> >> +
> >> +	if (desc->inblob_len != TDX_REPORTDATA_LEN) {
> >> +		ret = -EINVAL;
> >> +		goto done;
> >> +	}
> >> +
> >> +	/* TDX attestation only supports default format request */
> >> +	if (desc->outblob_format != TSM_FORMAT_DEFAULT) {
> >> +		ret = -EINVAL;
> >> +		goto done;
> >> +	}
> >> +
> >> +	u8 *reportdata __free(kfree) = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
> > __free() is new to me. Good to know.
> > 
> > But are we okay now with declaring variables in the middle of the
> > function? Any reason we can't do at the top?
> 
> Declaring variables at the top is no longer a hard requirement. The main reason
> for declaring it here is to use __free cleanup function. If we use top
> declaration, then we have free it manually.

What's wrong with allocating it it there too?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
