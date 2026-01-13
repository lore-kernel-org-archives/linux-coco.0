Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504F836215D
	for <linux-coco@lists.linux.dev>; Tue, 13 Jan 2026 19:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768332092; cv=none; b=ZasIKhgOPd4iTG0rBR2wQzghFdnHyHJI8g6S7DSCoQAp/X3QkBjnfGDYnWvaMtcMx9UNfVQp20ACkpHLGFagKUvzgr1Bq/r9AcCN/i+ssk5x0y2d5kB11/MbQKTSDVx31lWMj/RpXwHNif+scvUHerbS/Vwx+vkxjyuXyFmESa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768332092; c=relaxed/simple;
	bh=7Cta7CaeBQalDzt6VDM5OOi0esSeOHB4X7bUzLxzlJc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dxe4Zwu7/OmVzeZfA74Eb9s/log+i405r7gsSUCBpGninU7VmVWGeI3Tjes5eO2TdSRDYMyeWK8AAOc+B7CaG7XrMAWdI9wg94ymzvF4PJQ3/vhJ2Ka2yaSk6A04BScbgKxIuApFMxqX8bGxuVAseKTuqOEphDIS8TeYUKDx8Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=06KWWPO+; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="06KWWPO+"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso15402430a91.0
        for <linux-coco@lists.linux.dev>; Tue, 13 Jan 2026 11:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768332091; x=1768936891; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cd9IICRIq3DTaCVl8VXn5p++y32sGJCFM6gcMQfVFro=;
        b=06KWWPO+KSx5ujIpkGJCqLUzNaBMxOWtXq4jIXCyrwPqbBFNOt6IngTVDxXns88l6J
         t19q4SFT/a6yOcfjPFxC9OvXnMWE7eM8oOPP5YyKB7lmOonJLVwAjM90EYnYf0e/hj+f
         dDKpNwT5TpeMSde8473UHxur+NkVFBoxYxT9RS04kl+YP8kRWcRdVtVM0QFLiH4Z5RUu
         AOmg2FSWIRZfJDeW0BSJGsvZRTMys60ibDhNKZCU1pmsDMzBw+SkClM2QYGQySIMETsA
         6hYQZEA/CJp6tV9YtaTwXlPsD3RkSsn9QvdB1aPnsK9lucT8doB0/hmA8bUkRGUS7VD1
         PQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768332091; x=1768936891;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cd9IICRIq3DTaCVl8VXn5p++y32sGJCFM6gcMQfVFro=;
        b=BUEteU/u2ogkZadwjSJ0DHt/2yKGHNB/uo3r/1DAhyLLoGB+HJFRMdwE5jr4HaaKkN
         jaObtqFpEWXMfRZuzIzyTEPWbWfTE1b1PJ6tK0oTaL74QJzoVKYP+Fh5TC8N45pl9Zyg
         qJQmF+MNERdTv9WrunTYxmGcyeSVruISMNskopVO5U5MIopmEKpin5mEydZc6saXthud
         IjF7Y5NxCbxLyztmfvFsa4j7KxyGdpLNdu5qNz1Wj6PpQZK4DCSka6CX3mmRe2++FHNV
         u5gUu3v4R4wXLyfXQEpkyqn0VwlQqA8FTEdlU+x138kHvBn6aKBFiTFS3SHVz4sJbiPK
         KgBg==
X-Forwarded-Encrypted: i=1; AJvYcCXMSRC+vW2UuokIRc8ohFhP7TLiMNGPCMY5ZtG6VEhVdHg3vLbI5vF2NyCjHItBVr6d0eKhzr4SviCg@lists.linux.dev
X-Gm-Message-State: AOJu0YxJnKnV+6WedmW5rxcLVXXgFoP1O0h83EYmqZHoBldKsjAOA37+
	M7Cr6q8vE1y4xdjP1Aryb9wxHs7HVCA8Tdx7TsnZKyrJEoyXidnM3FkAvl5Fs8Q+qqQayTZH5QN
	f3o7umg==
X-Received: from pjut11.prod.google.com ([2002:a17:90a:d50b:b0:349:3867:ccc1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d50:b0:341:8ac7:39b7
 with SMTP id 98e67ed59e1d1-3510913cc0dmr105362a91.25.1768332090565; Tue, 13
 Jan 2026 11:21:30 -0800 (PST)
Date: Tue, 13 Jan 2026 11:21:29 -0800
In-Reply-To: <20260108214622.1084057-7-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260108214622.1084057-1-michael.roth@amd.com> <20260108214622.1084057-7-michael.roth@amd.com>
Message-ID: <aWabORpkzEJygYNQ@google.com>
Subject: Re: [PATCH v3 6/6] KVM: guest_memfd: GUP source pages prior to
 populating guest memory
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, pbonzini@redhat.com, 
	vbabka@suse.cz, ashish.kalra@amd.com, liam.merwick@oracle.com, 
	david@redhat.com, vannapurve@google.com, ackerleytng@google.com, aik@amd.com, 
	ira.weiny@intel.com, yan.y.zhao@intel.com, pankaj.gupta@amd.com, 
	Kai Huang <kai.huang@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jan 08, 2026, Michael Roth wrote:
> @@ -842,47 +881,38 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
>  	if (!file)
>  		return -EFAULT;
>  
> -	filemap_invalidate_lock(file->f_mapping);
> -
>  	npages = min_t(ulong, slot->npages - (start_gfn - slot->base_gfn), npages);
>  	for (i = 0; i < npages; i++) {
> -		struct folio *folio;
> -		gfn_t gfn = start_gfn + i;
> -		pgoff_t index = kvm_gmem_get_index(slot, gfn);
> -		kvm_pfn_t pfn;
> +		struct page *src_page = NULL;
> +		void __user *p;
>  
>  		if (signal_pending(current)) {
>  			ret = -EINTR;
>  			break;
>  		}
>  
> -		folio = __kvm_gmem_get_pfn(file, slot, index, &pfn, NULL);
> -		if (IS_ERR(folio)) {
> -			ret = PTR_ERR(folio);
> -			break;
> -		}
> +		p = src ? src + i * PAGE_SIZE : NULL;
>  
> -		folio_unlock(folio);
> +		if (p) {

Computing 'p' when src==NULL is unnecessary and makes it hard to see that gup()
is done if and only if src!=NULL.

Anyone object to this fixup?

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 18ae59b92257..66afab8f08a3 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -884,17 +884,16 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
        npages = min_t(ulong, slot->npages - (start_gfn - slot->base_gfn), npages);
        for (i = 0; i < npages; i++) {
                struct page *src_page = NULL;
-               void __user *p;
 
                if (signal_pending(current)) {
                        ret = -EINTR;
                        break;
                }
 
-               p = src ? src + i * PAGE_SIZE : NULL;
+               if (src) {
+                       unsigned long uaddr = (unsigned long)src + i * PAGE_SIZE;
 
-               if (p) {
-                       ret = get_user_pages_fast((unsigned long)p, 1, 0, &src_page);
+                       ret = get_user_pages_fast(uaddr, 1, 0, &src_page);
                        if (ret < 0)
                                break;
                        if (ret != 1) {

To end up with:

		struct page *src_page = NULL;

		if (signal_pending(current)) {
			ret = -EINTR;
			break;
		}

		if (src) {
			unsigned long uaddr = (unsigned long)src + i * PAGE_SIZE;

			ret = get_user_pages_fast(uaddr, 1, 0, &src_page);
			if (ret < 0)
				break;
			if (ret != 1) {
				ret = -ENOMEM;
				break;
			}
		}

		...
