Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663EBD50B
	for <linux-coco@lists.linux.dev>; Wed, 28 Jun 2023 17:03:42 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-262e89a3ee2so2354921a91.1
        for <linux-coco@lists.linux.dev>; Wed, 28 Jun 2023 10:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687971821; x=1690563821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7X1MQ2jmu23RjDWRI9rJrkgFC/BK54cuNgKhdsqxLjU=;
        b=RWgCANVaNQwXdVlM9whKym8GIJSg/S78nQR8TA/Qj8fTjpkAi/bvRjeFz3IZkBj9sd
         xbbsMF6ZO0aAGzSSsQ9LEH5MPhYbj6SYV7Y5r4WQNDl2LpmM7DKR9isT/TXayBeLhRkW
         G87KPrV9/5onObUv+06TGWStqGvEgM+j9SlX3/LfjeX+qCyZJ7qF9GOMqGQA0G5O4W+U
         h2zBiB6VUIMdTgaWs1DbGg236Z2FfhJBAI8+ZxJeuby+vaJEWUX+IYmYAMQn2+a1/DUQ
         ealQkH53QNMvI5pC/y9bOfVq2tvHkvhkuOQAJI5JPApiXcCWHYTEdUqes1x+EjQVXB7k
         vavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687971822; x=1690563822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7X1MQ2jmu23RjDWRI9rJrkgFC/BK54cuNgKhdsqxLjU=;
        b=PFrdLcGlLyKgTSH4dNNihjTuT7FqxxlOYo3nekJ39AbCUp24/jXBQ2di4CEk5QbVaj
         zggipYYihsepmX7KhNHETA18eTOkGLTuE2vaz8qRBc69FyrDN4nPgKyZoSyz+ASEWEqH
         bVOLrzDOxcm0pCUBIFMCDnT28yM1dv6JKMle5p+fDszfxCd/DocFJQk3zVQzYHWhanqt
         jfiehd1oqg3K9bEpQULCumRttbh/HzOAHkLCmF1Uesamr9y5XLy2Fb7r7zytSJGJufSi
         zFsKiIW9Zs8zqW4HsrQIR3Isxadn33c9mrzLSVdlqDyhV6SccqSlg/kUEDZ+oX5p402w
         +2EQ==
X-Gm-Message-State: AC+VfDzMWzZfkVhM3SPHXj+dPkaITPFC6AdRbF1dejLyHLeSPHhCUuEk
	UL2wi3juvdTi+M0nzitlLwc=
X-Google-Smtp-Source: ACHHUZ4woOfcDRZoR6fRC0mD8qdnmXF08MYeIWpnENA+znOobZQnQkaxXVwF8L8R3yHfioJB/vJABw==
X-Received: by 2002:a17:90a:3d82:b0:263:41ae:8163 with SMTP id i2-20020a17090a3d8200b0026341ae8163mr1765697pjc.12.1687971821556;
        Wed, 28 Jun 2023 10:03:41 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id u18-20020a170902e81200b001b016313b27sm2082416plg.88.2023.06.28.10.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 10:03:40 -0700 (PDT)
Date: Wed, 28 Jun 2023 10:03:39 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Yuan Yao <yuan.yao@linux.intel.com>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, isaku.yamahata@gmail.com,
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com,
	Sean Christopherson <seanjc@google.com>,
	Sagi Shahar <sagis@google.com>, David Matlack <dmatlack@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com,
	linux-coco@lists.linux.dev, Chao Peng <chao.p.peng@linux.intel.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Michael Roth <michael.roth@amd.com>
Subject: Re: [RFC PATCH v2 5/6] KVM: Add flags to struct kvm_gfn_range
Message-ID: <20230628170339.GE3436214@ls.amr.corp.intel.com>
References: <cover.1687474039.git.isaku.yamahata@intel.com>
 <689da77417c2f4055f02a71aab51ff603bc195af.1687474039.git.isaku.yamahata@intel.com>
 <20230628064156.pblgvaks4cvulb3g@yy-desk-7060>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230628064156.pblgvaks4cvulb3g@yy-desk-7060>

On Wed, Jun 28, 2023 at 02:41:56PM +0800,
Yuan Yao <yuan.yao@linux.intel.com> wrote:

> On Thu, Jun 22, 2023 at 04:16:29PM -0700, isaku.yamahata@intel.com wrote:
> > From: Isaku Yamahata <isaku.yamahata@intel.com>
> >
> > Add flags to strut kvm_gfn_range to indicate who triggered the callback
> > and new memory attributes.
> >
> > TDX needs to know the reason for a callback by kvm_unmap_gfn_range().  mmu
> > notifier, set memory attributes ioctl or KVM gmem callback.  With TDX,
> > zapping a private page from the encrypted page table and adding the page
> > back to the same private GPA results in zeroing the page, and the guest has
> > to accept the page again.  On the change of memory attribute from private
> 
> Is this part used to explains why on MMU notifier only shared pages should
> be zapped ?

Right for TDX.

> > to shared, zapping the GPA range irrespective to private-or-shared and
> > expecting the fault doesn't work for TDX.  Instead, zap shared pages only
> > and keep the private pages.  Concretely
> 
> Do you mean:
> 
> On the change of memory attribute, zapping the GPA range irrespective to
> private-or-shared and expecting that the EPT mapping for attribute converts
> to doesn't exist at the time of changing the attribute, zap the "from"
> attribute range only and ignore the "to" attribute.

That's what I meant. The requirement seems specific to TDX.
I'll update this patch following the suggestion by Sean. [1]

[1] https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com/
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
