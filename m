Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBC32D97B8
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284075; cv=pass; b=GV2mClkvbxygdcdR4rCFs7+X2vuwZdDLawtkDQRdpzgQss2oPUtiQUKRjEoQTFsFHkZqxLeRTzKq3FflEvUqiDz08jTJk7tjrNDXbg4Fb9j86GVkpJDzRMb4WqT8ABugbMjUsz8KjruMaX4nrrvxyqUyinDnX+fNzME4T76qgB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284075; c=relaxed/simple;
	bh=qQiJNamxvq/HKg+2DcbBfJZDz4xq8G4yBXbE6YWO298=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qy0LI1/9I2xZUt3y6xpyxWfN1S0zksQNm7aGw/28C4829ndILJ6HEwHuPBdnWdRb28J0mwbziKnF9LvvWH48V/YZQEOeuNzLzg7FthodhiWe0zmWSLEXKwrDgSOHJe7jnCyQvQl71+cyCFOoDMvw0UILsee7uoIFxngM3ipUKB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JdbDHXMm; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JdbDHXMm"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50e61648f10so10331cf.1
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 06:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779284072; cv=none;
        d=google.com; s=arc-20240605;
        b=YWJTA9Uq7zJKFi2FVDy7NZQe1rqTRY86JOH8Z1mjixbsnfrYULGhL5DQJFH/+bJUeV
         GYXRq4OAFjTa0r86sf0GH0b/N9XdhoeTTjWv2cs33vGxDnrf43+Ri+UTit2Ot2kpE0cm
         TA1efdGaKZ5hn8TtBw2/uJGWB3gU2+OJz/feNFu8u38o134m3JySN4cqEhBXTWTsBJzz
         gvcS2LJVPDJuxX92fptjHWmLbk2VnVUcv2nPcWYDjXtJY5cpQy90lbq50KT/FYHBaJ3g
         M6S44Yc2opfdJYfrNt7x7q0WPpihgjTGtdB+jMapF8X4OAvA8iuabErRpBk8Ze/vMFl9
         Fqgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gg6EIejukVN1UskEcFFGr4CnqhwTYz/FF3EfBDzQQN0=;
        fh=A5OWI3lajflOlo2OyTjrEpL5TBmYB5p6MpxgpcCPX/o=;
        b=DlGKhvM9L0UVdgjzeMAy3515YhlluswYk7eIAMpBzjV81RLchw/CHo8zvMesjxS79k
         rNm0dQPLCWyk4PgxsZPy51/9AfClC3m8ctWv95VMX8ow/xGN3Sqf7nvMs9YmkULONksG
         J09AlwFAxke7zBwCbvzINfhLW82wfkIGcELZ7s2BC7p+Z/+gpG0QzMgkQiyx7oa4j9qx
         zbNCDgWfU/rOXIjIngDxPO79izmQdjZjZ0Z9rreTDhb56LpmlZFUM1fbDGgLIEzzFym0
         IF/tjX+kLADXc+iX/iYWY758Ax0HeHSeNdEGG6dofT9e7wttbl4crkyXgI8XSzPY/ROp
         e4WA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779284072; x=1779888872; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gg6EIejukVN1UskEcFFGr4CnqhwTYz/FF3EfBDzQQN0=;
        b=JdbDHXMmVHrNLyYQiKOxDQLmgCdD3tr5HeGhCXRRrcVrBkI9P2MCEjKOmva7fMEhVZ
         ggo3ikPnxEo2pQwvwlFrk/rV8wUhLodOP5dnedW9NM8OAvOMD3XKFxbxe4Hbl8Dy/rx2
         +W076M5K5+Y/nfU0DYL6AQvD52KyIc5EQTTqr/NBnAorOTkGhu428DZh9sWQPU0yERk0
         9NCrUR5O+ChUkyGQNlgmEcr//GYcDAh+hliA/70Rs0G6YmMTfpinWkWJjd1q03VlVgUK
         xqADtelxb2TSwx+KmTVkRb7VmIKCp+A1PgWCi3QiSSagRsk9MmqLsKBHbq7Ea3Fn8AER
         zE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284072; x=1779888872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gg6EIejukVN1UskEcFFGr4CnqhwTYz/FF3EfBDzQQN0=;
        b=pjXjYXQB9RAfpnS1Gq7+9NSsUB6JR5Qt1IOZlcvIysOrLmz9tQBRS1VXi9BS+wZ7dj
         ONVXGBCKamqMEUa1s0mv0Tf1OraShrOEuNbieHWbJ3Bd6OfIbwgJtU32NEFAwmqzP3rq
         aKjiDOV6c67MpTdjxy2mrEMoYHc0B4EODDEQAeGaXEB8snnFLcRI4sFgUfLCrs+xSDbn
         NcyDP/HghQmBQI4//8P0xiwgVhqiQQSeC1AW6LNat2VxnAoMKokJb9sFso4u7CS9Znt0
         RBqKhrgmEffD4UHdeD2MrNgSbyKC0jQMzVSx3xB026QcJEnBSvdO2Y8BnZRd7JMdJSbN
         eZvw==
X-Forwarded-Encrypted: i=1; AFNElJ/IrYeqrLsOLsyvSlyM9ONdJQcB40f4sLBfnPyOkgjUOPg+6THI6Q0M7cEBqiOuFp5s7DBJisJmXVJj@lists.linux.dev
X-Gm-Message-State: AOJu0YzFt4yo5MgA6GTT57PPERlXrUfN5kwqEwRQ1Z73zf5y0+f61OQk
	0dwpxkHEL2QQBDh8ZqR0rcn/SL2xSFq4u3KkkTYmaduz2JyX83bIc2OI3hpRz9C+XYqxAxfFLnC
	/XR58c+++1qswEoZ0vGKFo3kIYsqOJyJNPX78O3C3
X-Gm-Gg: Acq92OFZF1KGb9hKWJ+UuWhUyBhJRvhS3TZb3x9PPzhALS6uKCP5LChc98WqAu864gB
	WfN2Y1g9QS+UC646n08XrYLhbEV81cZWztQL5em0OSlfeetPoHMY1tn7gIP9WWLtXIH5srBIN8F
	NyXG/+Lj+i/x9kFDlU5+/BFuoF5FB3DANEDiwYcJjsHqdntD7dV7/XaiIi3TCHZvfkl+SHwm34U
	mLn9ivKsvgqiuzvFxHmh66ou+hOOJnxIdcFoFcAl0D2Uhr959P5pZkVItkvTnRk4Cc61Tm9LbIG
	L9rUBrKMsIz/UIhJ3gM=
X-Received: by 2002:a05:622a:1f18:b0:516:5709:45e5 with SMTP id
 d75a77b69052e-516794404famr42713051cf.14.1779284071144; Wed, 20 May 2026
 06:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-6-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-6-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 14:33:54 +0100
X-Gm-Features: AVHnY4LNSFj0RfEZst7XJ-H9igWv5oxnJFnr1A0Uux_hrTg7SmxNRLrzDdjcxpU
Message-ID: <CA+EHjTxvLU4XDPXDXYXXWJES1OFQgN8VTRLMgCCNMwBE6Hk8tQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/43] KVM: x86/mmu: Bug the VM if gmem attributes are
 queried to determine max mapping level
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> When the maximum mapping level is queried, KVM's MMU lock is held, and
> while the MMU lock is held, guest_memfd cannot take the
> filemap_invalidate_lock() to look up the current shared/private state of
> the gfn, for these reasons:
>
> + The MMU lock is a spinlock or rwlock and cannot be held while taking a
>   lock that can sleep.
> + In guest_memfd's code paths (such as truncate), the
>   filemap_invalidate_lock() is held while taking the MMU lock, and taking
>   the locks in reverse order would introduce a AB-BA deadlock.
>
> Currently, the maximum mapping level is only queried from guest_memfd in
> the process of recovering huge pages, if dirty logging is disabled on a
> memslot. Dirty logging is not currently supported for guest_memfd, and
> guest_memfd memslots also cannot be updated.
>
> For now, bug the VM if guest_memfd needs to be queried to determine the
> maximum mapping level. This guard can be removed if/when support is added.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index a80a876ab4ad6..153bcc5369985 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3357,6 +3357,15 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
>                 max_level = fault->max_level;
>                 is_private = fault->is_private;
>         } else {
> +               /*
> +                * Memory attributes cannot be obtained from guest_memfd while
> +                * the MMU lock is held.
> +                */
> +               if (KVM_BUG_ON(static_call_query(__kvm_get_memory_attributes) ==
> +                              kvm_gmem_get_memory_attributes, kvm)) {
> +                       return 0;
> +               }
> +

This directly takes the address of kvm_gmem_get_memory_attributes,
which is only compiled if CONFIG_KVM_GUEST_MEMFD=y. This breaks
ARCH=i386.

Cheers,
/fuad

>                 max_level = PG_LEVEL_NUM;
>                 is_private = kvm_mem_is_private(kvm, gfn);
>         }
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
