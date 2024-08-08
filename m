Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9007113F435
	for <linux-coco@lists.linux.dev>; Thu,  8 Aug 2024 18:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723143078; cv=none; b=lAfqOkhjbUOxEsmNtFrX+w05bX7sP/AqGGH3nD+wCJbVgBfyxOkz1IqvQA6QLZZwkvM5Q2hNaQ/syMvW6y2UJgFQWLfgKkhKCqh3X0f3AvZF+osnArB70D6Xix/1+60zY4JOjyvcanmj8IztGZTldNPnw91gcA3jVdQrcEvdB5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723143078; c=relaxed/simple;
	bh=HisdoPQ3ufUq0Bsxr5WN1JnYKaQE8dTsbl30zp8Axw0=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=SC5ugMS9s8WEoP39HtBqwrXLnEf/BxvjAk2cTZgukL9q29h8w6QhlNPAkHy06DInp+KosfOKz023tVbHbphnNa6e5rrOKpgNPuP2BYsTnl/VoH3FZPTWIoiVvqT7m6Ihkh4P/ZgxTDSxx4pkQ42nR714qnHIDFSDxlsM2Q/brjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KD8u7kgg; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KD8u7kgg"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-650b621f4cdso27223767b3.1
        for <linux-coco@lists.linux.dev>; Thu, 08 Aug 2024 11:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723143075; x=1723747875; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=919ShyHXnz4ZPgDMjJG3RZAqRy1mIJY8sd8tW4tTOc4=;
        b=KD8u7kggcWC8YTtqoAyNQYOrBXZ9DpKxJC+Il7ygHhrV923XQHD63B54vmzpHe+F1b
         VDloOEqExYYh9QCrShqXGA/HDE8nnW5IGR53BtDRIM5QCUGFECky9rmUJGipMQM96fto
         yEvERqjuHRCo8LbdUeQECURySyFTJeQGXqwb17mQdtK4sc703xLFKQdZ2Iu0wiu5ZGdY
         FRa3RdBw7pGouybRre8CMG7erpdwvy1eNw9o/tcS5RP58IcNgtPeLDQU4gcbPswhTzSl
         xObrd5MJXXEOHIWogjvRI1l/kdvYFY7PvpGl2Aa8utkbsmkw4hD3PibHw2kS+UpoIiqF
         ACAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723143075; x=1723747875;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=919ShyHXnz4ZPgDMjJG3RZAqRy1mIJY8sd8tW4tTOc4=;
        b=vHRlN7i98mVsM88xIAX01GAQGQsi5kr1EmCy3t5Iy8UaZmIaOY2+sPkdtzJt9rYiFL
         XtpG3BD2c55CYuepojCo5PSJ9sTkiwUJg4CjGnKYhmWmpsi//rBu+YzO4Dr4zHbPsyoZ
         wQeH9C/cOINBDS47NXxTm94eUgDAbPcrVERsPNhf9TE82tcNgBS02ulKEmCjDGnjv/Ec
         JXnjubDsg23nKOrWz7eSaFve1A/soKnor52mWKIE4EMv+Ua6b0LtuvKH+oK3Gf4JScSK
         +EZMqkKvjJExenx87O5haNFxBDr3TXLH/WoImy16sWyE2yBhkG/b8vLwcaWruFUZmtsi
         iSLA==
X-Forwarded-Encrypted: i=1; AJvYcCWNkvJPbX4pGLN1KOu2XEbN9DKuDT4Vv0S+fC9VzQ4sQ6Gira9XZw1WFpvp6PkLk6b8fpaFYpzzL5Xk/roLisK0gBSFzP/JosBFlA==
X-Gm-Message-State: AOJu0YzAcHUWxTr6lrPbe/Nju+iT+Wfmbi+sg5tZLF4PIne/ieS9aJWL
	lleZfQkhZTgVK3sapbzOh0X3TnoIZkzkDGWilCCWTo49NNsaFtNJO/Uox1/resjXAAQA2tDUjgs
	QHqf7yvhFZobdTLJrKEtFDQ==
X-Google-Smtp-Source: AGHT+IEQ5328hwjTps5oONpSGlg1a6NprZPK1p18tP35idYNnnBAOTa7CiEvSSWe9UK3Repz5BAXsBLnBKJASbX0QA==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a0d:c1c4:0:b0:648:3f93:68e0 with SMTP
 id 00721157ae682-69bfbf94870mr995347b3.6.1723143075568; Thu, 08 Aug 2024
 11:51:15 -0700 (PDT)
Date: Thu, 08 Aug 2024 18:51:14 +0000
In-Reply-To: <20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7@quicinc.com> (message
 from Elliot Berman on Mon, 5 Aug 2024 11:34:50 -0700)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <diqzr0ayn90d.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH RFC 4/4] mm: guest_memfd: Add ability for mmap'ing pages
From: Ackerley Tng <ackerleytng@google.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: akpm@linux-foundation.org, pbonzini@redhat.com, seanjc@google.com, 
	tabba@google.com, david@redhat.com, roypat@amazon.co.uk, qperret@google.com, 
	linux-coco@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
	quic_eberman@quicinc.com
Content-Type: text/plain; charset="UTF-8"

Elliot Berman <quic_eberman@quicinc.com> writes:

> Confidential/protected guest virtual machines want to share some memory
> back with the host Linux. For example, virtqueues allow host and
> protected guest to exchange data. In MMU-only isolation of protected
> guest virtual machines, the transition between "shared" and "private"
> can be done in-place without a trusted hypervisor copying pages.
>
> Add support for this feature and allow Linux to mmap host-accessible
> pages. When the owner provides an ->accessible() callback in the
> struct guest_memfd_operations, guest_memfd allows folios to be mapped
> when the ->accessible() callback returns 0.
>
> To safely make inaccessible:
>
> ```
> folio = guest_memfd_grab_folio(inode, index, flags);
> r = guest_memfd_make_inaccessible(inode, folio);
> if (r)
>         goto err;
>
> hypervisor_does_guest_mapping(folio);
>
> folio_unlock(folio);
> ```
>
> hypervisor_does_s2_mapping(folio) should make it so
> ops->accessible(...) on those folios fails.
>
> The folio lock ensures atomicity.

I am also working on determining faultability not based on the
private-ness of the page but based on permission given by the
guest. I'd like to learn from what you've discovered here.

Could you please elaborate on this? What races is the folio_lock
intended to prevent, what operations are we ensuring atomicity of?

Is this why you did a guest_memfd_grab_folio() before checking
->accessible(), and then doing folio_unlock() if the page is
inaccessible?

>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  include/linux/guest_memfd.h |  7 ++++
>  mm/guest_memfd.c            | 81 ++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 87 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/guest_memfd.h b/include/linux/guest_memfd.h
> index f9e4a27aed67..edcb4ba60cb0 100644
> --- a/include/linux/guest_memfd.h
> +++ b/include/linux/guest_memfd.h
> @@ -16,12 +16,18 @@
>   * @invalidate_end: called after invalidate_begin returns success. Optional.
>   * @prepare: called before a folio is mapped into the guest address space.
>   *           Optional.
> + * @accessible: called after prepare returns success and before it's mapped
> + *              into the guest address space. Returns 0 if the folio can be
> + *              accessed.
> + *              Optional. If not present, assumes folios are never accessible.
>   * @release: Called when releasing the guest_memfd file. Required.
>   */
>  struct guest_memfd_operations {
>  	int (*invalidate_begin)(struct inode *inode, pgoff_t offset, unsigned long nr);
>  	void (*invalidate_end)(struct inode *inode, pgoff_t offset, unsigned long nr);
>  	int (*prepare)(struct inode *inode, pgoff_t offset, struct folio *folio);
> +	int (*accessible)(struct inode *inode, struct folio *folio,
> +			  pgoff_t offset, unsigned long nr);
>  	int (*release)(struct inode *inode);
>  };
>  
> @@ -48,5 +54,6 @@ struct file *guest_memfd_alloc(const char *name,
>  			       const struct guest_memfd_operations *ops,
>  			       loff_t size, unsigned long flags);
>  bool is_guest_memfd(struct file *file, const struct guest_memfd_operations *ops);
> +int guest_memfd_make_inaccessible(struct file *file, struct folio *folio);
>  
>  #endif
> diff --git a/mm/guest_memfd.c b/mm/guest_memfd.c
> index e9d8cab72b28..6b5609932ca5 100644
> --- a/mm/guest_memfd.c
> +++ b/mm/guest_memfd.c
> @@ -9,6 +9,8 @@
>  #include <linux/pagemap.h>
>  #include <linux/set_memory.h>
>  
> +#include "internal.h"
> +
>  static inline int guest_memfd_folio_private(struct folio *folio)
>  {
>  	unsigned long nr_pages = folio_nr_pages(folio);
> @@ -89,7 +91,7 @@ struct folio *guest_memfd_grab_folio(struct file *file, pgoff_t index, u32 flags
>  			goto out_err;
>  	}
>  
> -	if (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP) {
> +	if (!ops->accessible && (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)) {
>  		r = guest_memfd_folio_private(folio);
>  		if (r)
>  			goto out_err;
> @@ -107,6 +109,82 @@ struct folio *guest_memfd_grab_folio(struct file *file, pgoff_t index, u32 flags
>  }
>  EXPORT_SYMBOL_GPL(guest_memfd_grab_folio);
>  
> +int guest_memfd_make_inaccessible(struct file *file, struct folio *folio)
> +{
> +	unsigned long gmem_flags = (unsigned long)file->private_data;
> +	unsigned long i;
> +	int r;
> +
> +	unmap_mapping_folio(folio);
> +
> +	/**
> +	 * We can't use the refcount. It might be elevated due to
> +	 * guest/vcpu trying to access same folio as another vcpu
> +	 * or because userspace is trying to access folio for same reason
> +	 *
> +	 * folio_lock serializes the transitions between (in)accessible
> +	 */
> +	if (folio_maybe_dma_pinned(folio))
> +		return -EBUSY;
> +
> +	if (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP) {
> +		r = guest_memfd_folio_private(folio);
> +		if (r)
> +			return r;
> +	}
> +
> +	return 0;
> +}
> +
> +static vm_fault_t gmem_fault(struct vm_fault *vmf)
> +{
> +	struct file *file = vmf->vma->vm_file;
> +	struct inode *inode = file_inode(file);
> +	const struct guest_memfd_operations *ops = inode->i_private;
> +	struct folio *folio;
> +	pgoff_t off;
> +	int r;
> +
> +	folio = guest_memfd_grab_folio(file, vmf->pgoff, GUEST_MEMFD_GRAB_UPTODATE);

Could grabbing the folio with GUEST_MEMFD_GRAB_UPTODATE cause unintended
zeroing of the page if the page turns out to be inaccessible?

> +	if (!folio)
> +		return VM_FAULT_SIGBUS;
> +
> +	off = vmf->pgoff & (folio_nr_pages(folio) - 1);
> +	r = ops->accessible(inode, folio, off, 1);
> +	if (r) {
> +		folio_unlock(folio);
> +		folio_put(folio);
> +		return VM_FAULT_SIGBUS;
> +	}
> +
> +	guest_memfd_folio_clear_private(folio);
> +
> +	vmf->page = folio_page(folio, off);
> +
> +	return VM_FAULT_LOCKED;
> +}
> +
> +static const struct vm_operations_struct gmem_vm_ops = {
> +	.fault = gmem_fault,
> +};
> +
> +static int gmem_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +	const struct guest_memfd_operations *ops = file_inode(file)->i_private;
> +
> +	if (!ops->accessible)
> +		return -EPERM;
> +
> +	/* No support for private mappings to avoid COW.  */
> +	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) !=
> +	    (VM_SHARED | VM_MAYSHARE))
> +		return -EINVAL;
> +
> +	file_accessed(file);
> +	vma->vm_ops = &gmem_vm_ops;
> +	return 0;
> +}
> +
>  static long gmem_punch_hole(struct file *file, loff_t offset, loff_t len)
>  {
>  	struct inode *inode = file_inode(file);
> @@ -220,6 +298,7 @@ static int gmem_release(struct inode *inode, struct file *file)
>  static struct file_operations gmem_fops = {
>  	.open = generic_file_open,
>  	.llseek = generic_file_llseek,
> +	.mmap = gmem_mmap,
>  	.release = gmem_release,
>  	.fallocate = gmem_fallocate,
>  	.owner = THIS_MODULE,
