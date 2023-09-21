Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC4019466
	for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 21:34:48 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d81e72d4ec0so2975795276.0
        for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 14:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695332088; x=1695936888; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pR+2Sq/w5PO1VBsN7LGE/vsgLDdz85P5Qsv8lkXDhfw=;
        b=P94Bz0UJjv+efGqzGlOShJVudvIPNXw200nr4yPv1F4DiB4UHyb//fuYmRLJhrrs9Y
         hlM9nRum5bEz/RS3OrQbt3wtOBPsgBd4LhMS3+AifDxVIUK5o3jJ9ZfhOux9t7WL4evW
         /E1GyriH1cRdIRHTUOPLZDhlRpgCqXHZ9/nBZKSirPpjcraPO4mHvgJKNwxC4664pgo4
         ew6faK6m8GlMwyolt4Stm0uDI7DckwTCQifY6vB2qOLxOThtjbNS1ruLBLwMMbeotPRG
         WpzhxUYEYmk4PD/AWqy6dNgnbhY5vFnvbYpmJ/b0MafCI+s6A+h8fKWkV/CAOtihOiQz
         txCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695332088; x=1695936888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pR+2Sq/w5PO1VBsN7LGE/vsgLDdz85P5Qsv8lkXDhfw=;
        b=Nwi2UPemC8XH1h4siwv7VoYfmk676EvSgEgqlnnn3PAgaq+vNHZN51R45aWgOYHQ8L
         dewjEaYd3mdKBCEcvNxJa6L6cwWVvAZt8IRFV62sixk2uJA7Y/JEw4w2XXMltad25BR1
         5Qpn3eKZguunEHGy7l2b0RcA08QqZoV6ilf1AEZplRUTDF74is5cPtFAoBpPSrr2m+MQ
         yzIvRpp3Cc2fa20aLtkm1rh32LvyFhRjKMsvel5Sxk2wSmwZkr8CoMiyVeD5rl62con+
         XmPrca83cHeaD9VEgxs54mSeoI6/an00MyXJFutUs0/fmXUNmVus9zHP9hLCVbfHvG+6
         NQfg==
X-Gm-Message-State: AOJu0YycThS2ZIVitfHQq3OugOABJ2L3eQDVShOd7zOfriD8d1N0Gp/3
	8mGLlpeYLthzXa9faLv8UIZICQ+AeWc=
X-Google-Smtp-Source: AGHT+IHPp+gthilpe1ACitGvpuOvyGmVyPOCPYeySUnH3t8SZLPFwSVD9WckbY/e+Oyv6xiz6EbUHwXOp/o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ce4c:0:b0:d81:f70e:1e1a with SMTP id
 x73-20020a25ce4c000000b00d81f70e1e1amr13692ybe.0.1695332087878; Thu, 21 Sep
 2023 14:34:47 -0700 (PDT)
Date: Thu, 21 Sep 2023 14:34:46 -0700
In-Reply-To: <ZQypbSuMrbJpJBER@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1695327124.git.isaku.yamahata@intel.com>
 <f987dcde3b051371b496847282022c679e9402e4.1695327124.git.isaku.yamahata@intel.com>
 <ZQypbSuMrbJpJBER@google.com>
Message-ID: <ZQy29msIoAGQUGR2@google.com>
Subject: Re: [RFC PATCH v2 1/6] KVM: gmem: Truncate pages on punch hole
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Quentin Perret <qperret@google.com>, wei.w.wang@intel.com, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 21, 2023, Sean Christopherson wrote:
> On Thu, Sep 21, 2023, isaku.yamahata@intel.com wrote:
> > From: Isaku Yamahata <isaku.yamahata@intel.com>
> > 
> > Although kvm_gmem_punch_hole() keeps all pages in mapping on punching hole,
> > it's common expectation that pages are truncated.  Truncate pages on
> > punching hole.  As page contents can be encrypted, avoid zeroing partial
> > folio by refusing partial punch hole.
> > 
> > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> > ---
> >  virt/kvm/guest_mem.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
> > index a819367434e9..01fb4ca861d0 100644
> > --- a/virt/kvm/guest_mem.c
> > +++ b/virt/kvm/guest_mem.c
> > @@ -130,22 +130,32 @@ static void kvm_gmem_invalidate_end(struct kvm_gmem *gmem, pgoff_t start,
> >  static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
> >  {
> >  	struct list_head *gmem_list = &inode->i_mapping->private_list;
> > +	struct address_space *mapping  = inode->i_mapping;
> >  	pgoff_t start = offset >> PAGE_SHIFT;
> >  	pgoff_t end = (offset + len) >> PAGE_SHIFT;
> >  	struct kvm_gmem *gmem;
> >  
> > +	/*
> > +	 * punch hole may result in zeroing partial area.  As pages can be
> > +	 * encrypted, prohibit zeroing partial area.
> > +	 */
> > +	if (offset & ~PAGE_MASK || len & ~PAGE_MASK)
> > +		return -EINVAL;
> 
> This should be unnecessary, kvm_gmem_fallocate() does
> 
> 	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> 		return -EINVAL;
> 
> before invoking kvm_gmem_punch_hole().  If that's not working, i.e. your test
> fails, then that code needs to be fixed.  I'll run your test to double-check,
> but AFAICT this is unnecesary.

I confirmed that the testcase passes without the extra checks.  Just to close the
loop, what prompted adding more checks to kvm_gmem_punch_hole()?
