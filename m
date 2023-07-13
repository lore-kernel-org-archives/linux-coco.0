Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8CF1F938
	for <linux-coco@lists.linux.dev>; Thu, 13 Jul 2023 22:10:16 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-55b2ab496ecso628721a12.2
        for <linux-coco@lists.linux.dev>; Thu, 13 Jul 2023 15:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689286216; x=1691878216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gogTPYXLafipe4IJKLi8OWwxTihyvKkXkU2xENddLLA=;
        b=1K8OGQlOcob1VgQdPzcGoytN+L/KRaX4Y/HBOpcGL7kWPNn9RNw9JgP1mOrSTOEEO6
         gvR8cI2i85f2Umwo6f1HeslwyYD8R1JP2lyMc8EdeaIWRYrKB4/+VoLYOnWTfWSN69Jf
         5h84/eOwMNndzs/wiac+jyKQR26gi01fIW214lh4wXvNn84jvebBpjsDhGtoWxNxmg8B
         iteQ+h19RpXAUNatWnXUuoRi/y9oKljW+OIsS6ccCT9HDU3aabhLgQrTgsXix94rYiwC
         PCiBTEdmvu52n7ObZnUx44SnTnKs2zusczwZOnx5FoppnzwauGCib16Ht5Nk1IzU3PgI
         v+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689286216; x=1691878216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gogTPYXLafipe4IJKLi8OWwxTihyvKkXkU2xENddLLA=;
        b=N+BWIF5d/a24wuA6igizo6LBDFH4q2gcTXH5tqjmORrdyAllkOGYIuqqYW+Yiq/Tu2
         9FvoEz9gsR6ODHUOtWud0R6aBTS3Dc63AqskKFiSXse0VB/rRijWvgsBFdgw2JlDkK20
         SjPi0Gv/tyD3DW3OjMKMWR0sR538bWaRZVwu/ZHgdeXs8uB2wRmEZ6t535dr9qTFLvWi
         4IVeMm+jSz0FmTFwyo3LZG8eOoCAi0Z84oRm4+f5SshcZEvJpgue0Cwc8Tk+EG8rrMc2
         Ic7S/RntJAjbDdWYFdTC6ZmZ8cdYKBcIxALUWK9Fx1VQVzH7vOHaVbZVxlFjC0/9Gv8c
         kl6A==
X-Gm-Message-State: ABy/qLaCJWkPOMjI6hmicAJGIp0Dli/7RDqLfPC1EfKCp8sejsovC/dm
	c0um0y40OU4P4L38egzwF6kamGedsNQ=
X-Google-Smtp-Source: APBJJlFKBTGdsU9w5fXlOdzBJ3H1Wj190qbeOOztvGOvOIo9NINmHgA6U0s9w6S48to8L8SQgUj82tMSHIs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:cecc:b0:1b8:866f:6fc1 with SMTP id
 d12-20020a170902cecc00b001b8866f6fc1mr10059plg.0.1689286215874; Thu, 13 Jul
 2023 15:10:15 -0700 (PDT)
Date: Thu, 13 Jul 2023 15:10:14 -0700
In-Reply-To: <bbd17dbe371d6b12b2e7670bef6a4f080267c300.1687991811.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1687991811.git.isaku.yamahata@intel.com> <bbd17dbe371d6b12b2e7670bef6a4f080267c300.1687991811.git.isaku.yamahata@intel.com>
Message-ID: <ZLB2Ro55dKGElB9B@google.com>
Subject: Re: [RFC PATCH v3 09/11] KVM: Add new members to struct kvm_gfn_range
 to operate on
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, 
	Sagi Shahar <sagis@google.com>, David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Michael Roth <michael.roth@amd.com>, 
	Yuan Yao <yuan.yao@linux.intel.com>, Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="us-ascii"

+Yu

On Wed, Jun 28, 2023, isaku.yamahata@intel.com wrote:
>  void kvm_mmu_init_memslot_memory_attributes(struct kvm *kvm,
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 1a47cedae8a1..5ca0c8ee4292 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -260,7 +260,13 @@ struct kvm_gfn_range {
>  	struct kvm_memory_slot *slot;
>  	gfn_t start;
>  	gfn_t end;
> -	pte_t pte;
> +	union {
> +		unsigned long attributes;
> +		pte_t pte;
> +		unsigned long callback_arg; /* needs a better name */
> +	};

Making the union needs to be done in a separate patch.  And coming back to this
with fresh eyes, I think it makes sense to give the union a name.  I think an
anonymous union is actually worse in the long run, and there aren't _that_ many
instances to update.  E.g. that way a single build-time assertion can capture
all uses, and it makes it more obvious that the usage is poking into a union.

I'll post a patch separately so that it can be picked up for the MGLRU series
(and maybe even merged ahead of both).
