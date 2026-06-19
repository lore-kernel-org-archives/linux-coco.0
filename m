Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6DE372B39
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866329; cv=pass; b=QNDlHrUw2/1mcPZD3k4wWGeN7NQXWr5Mss7zdfzj9+SuWrVjyFEddN3ZUVL86WUGoHfF3vVIo/eZ88GUGXbZDWD2pV3aCvtkVTLOBS1JgA6hFE66f+8ja0dLkhcV6UXVQwWoPPf1gVGV3EjqTGnwDrc8RdVILNnhr31Xnu/0afI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866329; c=relaxed/simple;
	bh=FV+HhQxDLV3ClDVmAYwBBibFkDhfDGLaaVmYDJKEf4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4CWOBisyXfLqQf86KvTemYuPi/DFHKw5aYq+mGjEQrOlAEOs1NHfEXG9JK30a6euYhhqRpOOQ0EDqbkoXhWmv5+55mS3LdXEbt45NbeClZgqRfPkYut9xBuLGym65I2oYL1h82VfkQ6SSDyLj66pE4GU3A+PNxGeC7ctDJEL3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cRK0fxMo; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cRK0fxMo"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51765531803so233161cf.0
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 03:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781866327; cv=none;
        d=google.com; s=arc-20260327;
        b=gqXDuREHHkyh442n+6l0uWZxbBnDeyVpYkvsz50nB8nafjTM5JS9eZlT5f5gnVCcar
         cnEgREW/ZKyC2qDdJ79AcvbdAjotbNgOtrSZPpJI11TTLr7qU9z5Sw20cZnA4NU9CMI/
         sL3g1cy4OF4PzwnBLOvAgYM8lQj9Lt+ehddoGL4vH3giaaEScj4FbYQmDXwRs/Dv8YGj
         PkgL6oQ5tUxqwuhjuKXWptWXKwV8tfnw7F8ucxpX4EN6Ker0jNxInj+AmMuDFM1epJt3
         oc1W8mjj92hDottzfgkP/O9Jbv52jVTgI98yUxzMIfgLwASgX0cDdRytfXLZipivaiV9
         WWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qqrLJidqwZhWczfBA7HD/HFgW4vaG9cXUmJMg4P1TGM=;
        fh=BTsucd+bqg7qrE5GzhskL8SeRyXLHMWSS07SzqtmBbk=;
        b=I4UgShiNuvrU+sXMxsGaZWXRrTNWGyvGVapBdwF0w1UiEJ2FZZvWBVt77tjdFW+GAq
         MsSzvYbreA3Co1BP27JWpu88z1celF4ccyYW7lcVLrhXYHZleqIbW7gPEA4GhPHz6hun
         5/s6CnsQqKKxCO0y9HRGRK0krN+LKNMbPEglBRxrVYngA5Btvyk02AbtQiqBZTsq4HUl
         Ow55Kmaba70XWMGlZeg9z8GIN3rw6nnHoZ1hWMF/6n+4IQMMKw92e844I/YPF5nPCGi5
         +tvczXikF8qlAB0Ci5Sq40G6hhi6sI0Oy7XLBlQH7RtFYPk8gcs82pNkj/9MTkYOGQMY
         8vxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781866327; x=1782471127; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqrLJidqwZhWczfBA7HD/HFgW4vaG9cXUmJMg4P1TGM=;
        b=cRK0fxMo7szR5RPgjJeZATgHN3XJhTtH2lwQbV4Ky1dPwin3cFKIqoqRvpWXwvNxUF
         eBByeNtFoVfFTGphum/FUVGnfoXLp5dAphYf/2BYyFrg2tPWwQPiiNZ2e99dvxnLe9nw
         J5QrH3GwxW7/i/+VHcl/aqhgrsj3M2CknngJBdyqsjHtQZgzQFto3C6k8ropP3o5M0NY
         KE+7aymO8RJ16AWJJvsioD/UWuUcQcgmRTG/JW+TSncvPK7+KZDTQRdDPM7CrxRDqvDU
         yhcG27+KlUJDW0yKPz3bQdCUcrZ/kA9OU+674T24eSvHU1eZPrTo7q3XoE+PW77KzYvH
         LUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866327; x=1782471127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qqrLJidqwZhWczfBA7HD/HFgW4vaG9cXUmJMg4P1TGM=;
        b=I5Ogg/JBrHJqozw16obetHyLXVYqm2NhhtOetZIFEZP9FxCiZsJ79q1OxzsFkINrz+
         y1KAWdHHHzbH+1Djqr1snCWs/Syhbk0E3h0GGVEu2p8mcfXI9LINfv9B951lMVYQb0i1
         pgazgl/csF259bcHAVAAUSnfVHCBZ2S23Upd+uVI2Dv1eQsFPmR6chjxZKALwLR181Pj
         8+rZgWiXa5rusqOLUyovHYYqmZozd/lH9Ek238FuMyhCY/hhyamkJ56XjBvHw0jdgkqL
         U4GHwPmVrJbHMHczdbO4lWms05bvNct4yw1bL3Bul0K9sdqXMJQmNVGJDkoQQY365kIq
         Bo0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8fB7jQ183UKwPNOLKOnBDoNExPo8kP915NHXH1MTdhWvwu3g03kaF+E2M+WWVczT77fKq1wDPKX//O@lists.linux.dev
X-Gm-Message-State: AOJu0YxBzdEGfj1TXKUsS6Wk6S6VcaIxhiUUthCOWpM/Yr4t6Q/M5Y8T
	OGF4mHJ9l6ylKN+whlKj03IbrQHn45RFUlhWcOQTBQUVQc53hgMyDeOZ2UXP60o0jfZJhc/Lbw1
	HSlApNTqOPmYZn6qkmpeUjKSJFay7e/9nBepGrRps
X-Gm-Gg: AfdE7cmYZvGoiB2amOb5/ugHA1dOlyciSs2dKnHYRw5384l3guEVd99NhHbYb9cJfMr
	oK/2UkFFlAeGfa0ZSVIqtNvWag5jy0nJ99cyi5njnb4FUJAaIIKdYx+AjvdxygtzMgNemnN0n6t
	FvTKrailbF2sDcWEhIvJiK/5xOx2A1YeNt7IK5X3JCogAgOMInSbAy+1lEaWZLhd8Svi+2P3LOi
	C/9JX7rf4/vLhKnQGqpSHrOhyKhFRGYvNzrA4Dj73n3J54FQfJRYOUiKOYp3HLuuWO5RsdSig==
X-Received: by 2002:ac8:5e0d:0:b0:50f:be7b:923a with SMTP id
 d75a77b69052e-519e890f9bfmr5827961cf.9.1781866326641; Fri, 19 Jun 2026
 03:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-21-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-21-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 11:51:29 +0100
X-Gm-Features: AVVi8Cf7maLTmO8Ms_Jrooo0n7Lq-o--etDJs7TRVCXqEuhsxAt-xpYkzSdEOcg
Message-ID: <CA+EHjTxOYWNeZ=2Atxn0iGQTOskR+Y3uiujWEOOfGLGcWadoUw@mail.gmail.com>
Subject: Re: [PATCH v8 21/46] KVM: guest_memfd: Zero page while getting pfn
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Move the folio initialization logic from kvm_gmem_get_pfn() into
> __kvm_gmem_get_pfn() to also zero pages if the page is to be used in
> kvm_gmem_populate().
>
> With in-place conversion, the existing data in a guest_memfd page can be
> populated into guest memory through platform-specific ioctls.
>
> Without first zeroing the page obtained using __kvm_gmem_get_pfn(), it
> might contain uninitialized host memory, which would leak to the guest if
> the populate completes.
>
> guest_memfd pages are zeroed at most once in the page's entire lifetime
> with guest_memfd, and that is tracked using the uptodate flag.
>
> Zeroing the page in __kvm_gmem_get_pfn() is chosen over zeroing in
> kvm_gmem_get_folio() since other flows, such as a future write() syscall,
> can get a page, write to the page and then set page uptodate without
> zeroing.
>
> This aligns with the concept of zeroing before first use - the other place
> where zeroing happens is in kvm_gmem_fault_user_mapping().
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  virt/kvm/guest_memfd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 90bc1a26512b6..86c9f5b0863cb 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -1137,6 +1137,11 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
>                 return ERR_PTR(-EHWPOISON);
>         }
>
> +       if (!folio_test_uptodate(folio)) {
> +               clear_highpage(folio_page(folio, 0));
> +               folio_mark_uptodate(folio);
> +       }
> +
>         *pfn = folio_file_pfn(folio, index);
>         if (max_order)
>                 *max_order = 0;
> @@ -1166,11 +1171,6 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                 goto out;
>         }
>
> -       if (!folio_test_uptodate(folio)) {
> -               clear_highpage(folio_page(folio, 0));
> -               folio_mark_uptodate(folio);
> -       }
> -
>         if (kvm_gmem_is_private_mem(inode, index))
>                 r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
