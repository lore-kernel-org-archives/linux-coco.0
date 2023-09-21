Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB6C18B18
	for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 20:37:03 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1c4375c1406so11594675ad.1
        for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 13:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695328622; x=1695933422; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aP7hpifj13TY/cmxy/VtYAtAKQo7n6lxac2QUYqGXnE=;
        b=betF0khUmgXaeZAkBSOCdUrZz7lys8PYtKktnVw2Pi7xxP+L9qXNl15Sro3DJEYsTy
         FBcKguCutufoCOoig7170XNa02sXFmOHe9OYwBGc6nt7dGijQsR5pkCDaMEHjpWzy7OY
         QjBDiQruub+dN4IqW/NJU+eww5O9/vd3HMK7WPpY7VjYw+T3Agpuw1AzAe3vu0Q9w9td
         M/vPBSQUV+L9v2ol0+tA3f60DNhJDdp3yLav0jeiUB900boMTbidedhrvXWaESJiwn1L
         8xJ+T7uBcS1WK5C978hTmVaLeakC2O0RUz3yBIM/SzgInxXIst+UkERcamHhhgqadkvz
         gWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695328622; x=1695933422;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aP7hpifj13TY/cmxy/VtYAtAKQo7n6lxac2QUYqGXnE=;
        b=Qm7ROvRO7bCmCO3EK2QKO6pTiScl6fxgpC8PtJMQLAwovYIoW7c9L08DEzieO9u/N7
         9pKuYzY0FU7B+Mq9ccoFpBAu1KQjE9umofX0iGWtcE1Ywc2CBm0V2jTqAwPNYqKK0fNg
         29e5dm0SHrbcj1Dxqk+OifGR35YJ56RGAWquO1YOzd+Giv/4YusuAJEEk5zP6V6SoUxJ
         7cjjWb34wbV6HfUpb+/mn+k6EarzaI4NkzkkJYEZWkKny107UdKMgeQAnPcKS3o20fjV
         4xIz6QeH0illpPzWUVKbVSIC0eJziREbCX4g/+nouvtvAxcJsWZTdGZCYfEp0vIJWEa4
         VBLQ==
X-Gm-Message-State: AOJu0YyFVoC4vm+ILopciRUD8izM6r+8DzbHAVw7EwoB3aKeOL9WyY8M
	fQcjaKd+AUjVj4gNDORzgJipghK8+LQ=
X-Google-Smtp-Source: AGHT+IEWJRg13o8CQmL28cdN0w6eaHgxHhAvKYngOPLn2gpdCakJVl0UPMB+5b2YBqkaLGEngQ4iwIMDAII=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:1c7:b0:1b8:3c5e:2289 with SMTP id
 e7-20020a17090301c700b001b83c5e2289mr84379plh.2.1695328622355; Thu, 21 Sep
 2023 13:37:02 -0700 (PDT)
Date: Thu, 21 Sep 2023 13:37:01 -0700
In-Reply-To: <f987dcde3b051371b496847282022c679e9402e4.1695327124.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1695327124.git.isaku.yamahata@intel.com> <f987dcde3b051371b496847282022c679e9402e4.1695327124.git.isaku.yamahata@intel.com>
Message-ID: <ZQypbSuMrbJpJBER@google.com>
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

On Thu, Sep 21, 2023, isaku.yamahata@intel.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Although kvm_gmem_punch_hole() keeps all pages in mapping on punching hole,
> it's common expectation that pages are truncated.  Truncate pages on
> punching hole.  As page contents can be encrypted, avoid zeroing partial
> folio by refusing partial punch hole.
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>  virt/kvm/guest_mem.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
> index a819367434e9..01fb4ca861d0 100644
> --- a/virt/kvm/guest_mem.c
> +++ b/virt/kvm/guest_mem.c
> @@ -130,22 +130,32 @@ static void kvm_gmem_invalidate_end(struct kvm_gmem *gmem, pgoff_t start,
>  static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
>  {
>  	struct list_head *gmem_list = &inode->i_mapping->private_list;
> +	struct address_space *mapping  = inode->i_mapping;
>  	pgoff_t start = offset >> PAGE_SHIFT;
>  	pgoff_t end = (offset + len) >> PAGE_SHIFT;
>  	struct kvm_gmem *gmem;
>  
> +	/*
> +	 * punch hole may result in zeroing partial area.  As pages can be
> +	 * encrypted, prohibit zeroing partial area.
> +	 */
> +	if (offset & ~PAGE_MASK || len & ~PAGE_MASK)
> +		return -EINVAL;

This should be unnecessary, kvm_gmem_fallocate() does

	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
		return -EINVAL;

before invoking kvm_gmem_punch_hole().  If that's not working, i.e. your test
fails, then that code needs to be fixed.  I'll run your test to double-check,
but AFAICT this is unnecesary.

> +
>  	/*
>  	 * Bindings must stable across invalidation to ensure the start+end
>  	 * are balanced.
>  	 */
> -	filemap_invalidate_lock(inode->i_mapping);
> +	filemap_invalidate_lock(mapping);
>  
>  	list_for_each_entry(gmem, gmem_list, entry) {
>  		kvm_gmem_invalidate_begin(gmem, start, end);
>  		kvm_gmem_invalidate_end(gmem, start, end);
>  	}
>  
> -	filemap_invalidate_unlock(inode->i_mapping);
> +	truncate_inode_pages_range(mapping, offset, offset + len - 1);

The truncate needs to happen between begin() and end(), otherwise KVM can create
mappings to the memory between end() and truncate().

> +
> +	filemap_invalidate_unlock(mapping);
>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 
