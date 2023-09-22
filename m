Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AA227704
	for <linux-coco@lists.linux.dev>; Fri, 22 Sep 2023 20:32:49 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1c5b1e55d5eso24336025ad.3
        for <linux-coco@lists.linux.dev>; Fri, 22 Sep 2023 13:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695414769; x=1696019569; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CSRAsOXqUG0ER0BOAKiobqvlHfjAj6fkRHJ850CANRE=;
        b=KaINyi5CaHpFrnc2TCZGB2buYjharjaZpeEjIlvK3Ak5E1mEip+TMJdxpgXB4dnkT+
         GPlDLLd7g3wn3N8KSek2wTq47pCtNuh+dDhrTIWDXn+swdcovQdWPIMEKz5K4PL+I+al
         4Nf+/zCK7E6cMDTZn+NF6Q2oNhAs1R2Iu/IFSKHXCCqtKOCAM+yaD1MKZvfagNiIETmp
         5dZWmqBhXVC6zCtFviBPGGukl52vS5rG4QcMIgHSB9XNbwwOugaX9Jf91UZQqh1Ry9rk
         B1pQ1Q340oF5orv2IbiCJhblXpLBMfhxqhiP6lJZuxO6gznvdukxdL1feH0SOuYBz0PA
         JZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695414769; x=1696019569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSRAsOXqUG0ER0BOAKiobqvlHfjAj6fkRHJ850CANRE=;
        b=uPx75zPIYMgM6ciPERy3vrzl2RGnZXpM3nXih/la2Q/ByEwh5pRCJIoq1rIAlwB8PW
         Uu42YxPhh/eKHT0rCd9YLxnIP4BqSHVic76uDjAUK/j90a78RYMUpAtrxMplpDfMmOze
         0zwyiapr18gt6WKToek0EoZ++A1NjVYhK5Dx1mnj6fAhTs9AKDZItVyLgH0RbcER4pBH
         oGdxhNiZ3G6sF6GcKEpRBlZc4u6U7g18SaMTD3Z0aJzWrXWimkld8pI5l9d+tahAM81e
         xuB5YhpAJ0rGfsKWNaw7petLjX46Bwl/o3BfeLtGa0UevRTcv34BYK8eJrSRa5jXrhHl
         q6tA==
X-Gm-Message-State: AOJu0YzzCdkTM3i8y4B3h1rq64r923TeeB3xlB836BUn1YOtBCGEFa44
	O4KIyg7gKmTq4Ms+UbWGijlBPfD1gWU=
X-Google-Smtp-Source: AGHT+IEiBw59NffQePuDv4nERVBcRa7yli0EECdvxQRHySgvasoDIFxcuZKKvgHTJ5qWHHbpwqq2PFwVIKQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:fa8d:b0:1b9:df8f:888c with SMTP id
 lc13-20020a170902fa8d00b001b9df8f888cmr4603plb.8.1695414768675; Fri, 22 Sep
 2023 13:32:48 -0700 (PDT)
Date: Fri, 22 Sep 2023 13:32:47 -0700
In-Reply-To: <20230922194029.GA1206715@ls.amr.corp.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1695327124.git.isaku.yamahata@intel.com>
 <ZQynx5DyP56/HAxV@google.com> <20230922194029.GA1206715@ls.amr.corp.intel.com>
Message-ID: <ZQ3573rbNQpbNf09@google.com>
Subject: Re: [RFC PATCH v2 0/6] KVM: gmem: Implement test cases for error_remove_page
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@linux.intel.com>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, isaku.yamahata@gmail.com, 
	Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, 
	Sagi Shahar <sagis@google.com>, David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Quentin Perret <qperret@google.com>, wei.w.wang@intel.com, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Sep 22, 2023, Isaku Yamahata wrote:
> On Thu, Sep 21, 2023 at 01:29:59PM -0700,
> Sean Christopherson <seanjc@google.com> wrote:
> 
> > On Thu, Sep 21, 2023, isaku.yamahata@intel.com wrote:
> > > From: Isaku Yamahata <isaku.yamahata@intel.com>
> > > 
> > > This patch series is to implement test cases for the KVM gmem error_remove_page
> > > method.
> > > - Update punch hole method to truncate pages
> > > - Add a new ioctl KVM_GUEST_MEMORY_FAILURE to inject memory failure on
> > >   offset of gmem
> > 
> > Doh.  Please try to communicate what you're working on.  I was just about to hit
> > SEND on a series to fix the truncation bug, and to add a similar test.  I would
> > have happily punted that in your direction, but I had no idea that you were aware
> > of the bug[*], let alone working on a fix.  I could have explicitly stated that
> > I was going to fix the bug, but I thought that it was implied that I needed to
> > clean up my own mess.
> 
> Oops sorry.  Now I'm considering about machine check injection.
> i.e. somehow trigger kvm_machine_check() and its own test cases.

Unless we can't extend fadvise() for some reason, I think we should pursue
FADV_HWPOISION.  The enabling should be downright trivial, e.g. just implement
file_operations.fadvise() for guest_memfd, have it handle FADV_HWPOISON, and pass
everything else to generic_fadvise().

It'll basically be your ioctl() just without a dedicated ioctl().

At the very least, we should run the idea past the fs maintainers.
