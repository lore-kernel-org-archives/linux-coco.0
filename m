Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3FBA2C
	for <linux-coco@lists.linux.dev>; Fri, 18 Aug 2023 22:33:49 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d6b66b41232so1713180276.0
        for <linux-coco@lists.linux.dev>; Fri, 18 Aug 2023 15:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692398028; x=1693002828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NhEwl8ITGQcTfYN5ElDC4AmBI4NmU0oAW6H6kQx3LJQ=;
        b=s+LHBPfCmaOjRDlN9GI/+ZGoEpD6ePDnRpVcb3uFtlONTsP9JqACJWMFtGw6mUO1f0
         E1snrfpmK5kNjirXqCZS+5CA/iZQk2ncSRDAJ9x/Z+tcJL+fXx5UPxqxZ2bbOm9xoJ1D
         FT1Zd7xUcJtbGnM9WRvNt2IAZe0OMtgFrVbuiC9i7zz1bzXIoEPAkmPwUkyLH3cOi1Mg
         3IfJgNHpXr1BQ8AuDPtwWBNE3Yz4r0bGkdIgL5KsFjNib1IaQ3khjAgtJMdtwxWJf1Bx
         2S1zAs5/7aFOndGw+ptCV1YR83A4EShCLHivgvxnJEef2PcsY4uGcGQs86G/cxY9aa16
         /tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692398028; x=1693002828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NhEwl8ITGQcTfYN5ElDC4AmBI4NmU0oAW6H6kQx3LJQ=;
        b=EsrQ7sZV6MRie6kIX85JJdcfx3P0DiAhsjYom84D+ZqluDoViJXepDzIwfb32fvYBk
         PWuHK5ghux/BJNg9fiQZ3vLXQNh3990yCNqsfZsVlP46eEQyCk67tuX8EZyWoCWz5RbV
         ON8T9rfhiUGWQOfNwatCpuM9AGH9UsXSYwa65M9WfdYP2DktFSHwIXEn3lRo1TEH7+Gt
         uPveF5xJuwLYa27jUM4NVk+zpBDDOe8k19V0yowjTw2HSwNo1Qzp/1/qxrZeMCA24Hjx
         edujNhmwHPCqBRgrhYTGjPBiXtPrH1WBXzLOGBVgkib36twk83AQEBRF1WsPoerKfilh
         Itlw==
X-Gm-Message-State: AOJu0YwkfIQfzxcppftocHsh3uuwEcGvFrqylMP3HTPOzjdg8u2jJ+m8
	Q8RjA9ewL/zXOG8mf88TuFrXIuK+EgA=
X-Google-Smtp-Source: AGHT+IFH27W0J3FpLsSsyh6gpjSRTEpCWHOAm5ANIV7muCzGRClMm1/4A0wcNfxBy5CDeXjGqco/XUuVEJo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1786:b0:d74:5e2c:4c5a with SMTP id
 ca6-20020a056902178600b00d745e2c4c5amr5154ybb.5.1692398028159; Fri, 18 Aug
 2023 15:33:48 -0700 (PDT)
Date: Fri, 18 Aug 2023 15:33:46 -0700
In-Reply-To: <ed4ab1239f0e048c25154884a1811214fb38587f.1692119201.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1692119201.git.isaku.yamahata@intel.com> <ed4ab1239f0e048c25154884a1811214fb38587f.1692119201.git.isaku.yamahata@intel.com>
Message-ID: <ZN/xyqsEUaGcpju/@google.com>
Subject: Re: [PATCH 3/8] KVM: gmem: Fix kvm_gmem_issue_arch_invalidate()
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

On Tue, Aug 15, 2023, isaku.yamahata@intel.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> __filemap_get_folio() can return error.  Use IS_ERR_OR_NULL.
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

*sigh*

(a) This patch is ordered incorrectly, it belongs after patch 6.

(b) Don't post broken patches with fixup in the same damn series.

This is not hard, these are basic rules of the road.

Sorry for being grumpy, but I spent way too much time figuring out what on earth
was going on, for something that should have required exactly _zero_ effort on
my end.
