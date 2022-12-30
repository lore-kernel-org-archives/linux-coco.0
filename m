Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77B23B7
	for <linux-coco@lists.linux.dev>; Fri, 30 Dec 2022 11:53:44 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 48FB11EC01CE;
	Fri, 30 Dec 2022 12:53:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1672401216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=Laxh/C9ZxuZYfqJQTUOidfRa5K1UWorXoXDiSpqTcos=;
	b=aZ/ZVHx2XblvvfDYa6I5gkaw9K45VXC1wGgMmR4Rt+0TxEdwHLGzcLwR7kAhCQg8FBQooo
	27XdQk6Z6g84QV53TMX4/pmTCe+yXe20CXRFBG55EiRKgfOlFegblcNhjA4dqU8ll15E7A
	bahtGtrJuBN+3vTzS5obIjnUDVeQgu0=
Date: Fri, 30 Dec 2022 12:53:31 +0100
From: Borislav Petkov <bp@alien8.de>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
	luto@kernel.org, dave.hansen@linux.intel.com, slp@redhat.com,
	pgonda@google.com, peterz@infradead.org,
	srinivas.pandruvada@linux.intel.com, rientjes@google.com,
	dovmurik@linux.ibm.com, tobin@ibm.com, vbabka@suse.cz,
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org,
	ashish.kalra@amd.com, harald@profian.com
Subject: Re: [PATCH RFC v7 06/64] KVM: x86: Add platform hooks for private
 memory invalidations
Message-ID: <Y67RO+YnQYSX4mvN@zn.tnic>
References: <20221214194056.161492-1-michael.roth@amd.com>
 <20221214194056.161492-7-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221214194056.161492-7-michael.roth@amd.com>

On Wed, Dec 14, 2022 at 01:39:58PM -0600, Michael Roth wrote:
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index a0c41d391547..2713632e5061 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -7183,3 +7183,8 @@ void kvm_arch_set_memory_attributes(struct kvm *kvm,
>  		kvm_update_lpage_private_shared_mixed(kvm, slot, attrs,
>  						      start, end);
>  }
> +
> +void kvm_arch_invalidate_restricted_mem(struct kvm_memory_slot *slot, gfn_t start, gfn_t end)
> +{
> +	static_call_cond(kvm_x86_invalidate_restricted_mem)(slot, start, end);

Why _cond?

> @@ -258,6 +263,17 @@ void restrictedmem_unregister_notifier(struct file *file,
>  				       struct restrictedmem_notifier *notifier)
>  {
>  	struct restrictedmem_data *data = file->f_mapping->private_data;
> +	struct inode *inode = file_inode(data->memfd);
> +
> +	/* TODO: this will issue notifications to all registered notifiers,

First of all:

verify_comment_style: WARNING: Multi-line comment needs to start text on the second line:
 [+     /* TODO: this will issue notifications to all registered notifiers,]

Then, if you only want to run the callbacks for the one going away only,
why don't you simply do:

        mutex_lock(&data->lock);
        notifier->ops->invalidate_start(notifier, 0, inode->i_size >> PAGE_SHIFT);
        notifier->ops->invalidate_end(notifier, 0, inode->i_size >> PAGE_SHIFT);
        list_del(&notifier->list);
        mutex_unlock(&data->lock);

here?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
