Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF9E380FC3
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 09:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379222; cv=pass; b=Mk6HD711RjI/zKfqNEJJ5Cpp+OUw5FE7Av/51WAadhXg2NNSCjD+l/Ocwh9aTWitk7z7VExS/89bDd5r1UEsa7Ves+a2x6fB3crNtZXqT84D988vEi3T1YJ6ezunpUfRQObTcHaLhBtC8hdo1yLJkCuvPk8GxgxLsvfqhLVU3TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379222; c=relaxed/simple;
	bh=VvJfZbIRil3c4qUEVncM0B4gssrwDmoZt1aKoqwRohw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5Jh7TbPb/QheUJjTvLS46rQOV1WITKttfZDvqJWcJ7yO1sbNFBE2LEWZSj9UwGtH6d6pAHuUYzyXrJ99oHPtBHtf5qeRHLziPoMeQdCIQYGWm+DJp1N4ZLjoMi9kXWcpJtvD/Kb7vYsUWD0lAO/fWW+vmxEnY12ieBUvH8CdCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UTz4POga; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UTz4POga"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51765331535so162441cf.1
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 02:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782379220; cv=none;
        d=google.com; s=arc-20260327;
        b=DUTitX0T/8yEB09jNapZa6k6xiCS/wEA3nj1ck6G6J0jdOGi8ndO/t+EiJy/oK618+
         mg8GvmhWAosH4SRbGQG0NZfNYfEB4UTUtAJO1Pn4gzmBBita0MlvVEjpirFtWAmtJRug
         8VflCofVQO/ssqf9pnWzNIXsF87ZSut0bmXmuvGuM6V8wqYH4tpMfmayCeuvzBxwBR0p
         zGgaMaa3pNaC19yvsXZ6EnE6OqG1K3OuP2N084ZyygTarBj27qy6yiHDVBO7irueBb7K
         vFA9jxFZVkHRezcu2/JT5rTOhaYslwInC9KmIszUZnA5qYja1ojRuApbV/UIul/ZroCL
         cqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9sNVNZ83P6g0a7P8tPRt1nDyKQGm49SitMTFhdy7JFs=;
        fh=QA13PKlv/j5Azo1rvVjUHErblXD6lmjJRPmXooa4Xsc=;
        b=jpAvQih/2jE6CGNA7tLU5p4Vl5MbQ1saHO/J7DTWiK/LXx8/sVZNVpfr2fhW+8MHku
         aKk3DzFu4td2jA7pA5GNnxagR3fdeZoDvV4291Ox+rndOQrMiP3VclatBFMrp7IuVRKk
         YsQYre21ugAMWBLKbSr6LWKg/8zbaC06DMpVUoAU99+tU3CcWO5FD0kka8zir7Y1Zkb0
         1jXuH8wh03gFCzawPUoBxxB9oYfRrzyXdXosnwnPY+rgSCOeoYFbm0fh87p/dxW7IFfJ
         ju4wTjGDKBnAaeDFDb326+3BLWZzGLatsGEQzh72XTInSR3qyAPyIW8HJhjwZUMuOiqM
         e2GQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782379220; x=1782984020; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sNVNZ83P6g0a7P8tPRt1nDyKQGm49SitMTFhdy7JFs=;
        b=UTz4POgaaslFGyeHcSSzjhQaT7BQNn7agk22atgftGrIhO3GRMiHSg28/LV60GAlXw
         GWZiu3TrNvKGGDwqRogUpfYRg4Xbn5gHJ5oTM0F8oIWXgEn2+h+4QJAfpyfER4aLCC39
         5/jKYGdSzaDuquKpCFE2zXOuqL4AiI1qmryN1TtXZ47vWf7cgTGPuPOQN17TmYzg0Xmj
         Bh8Jk7MG37Mr3Fm8oe8rFEflmku8TW1kZqv3W3YZjM4Iu4jCyiohThuUvb4d6/w4oQ8k
         jErvcHcYf1rti7lmMXrYgD5LOeAV1UTYPeOPDqHmQoZC2WdpWy/v0wmObx8onoKu6gx9
         fGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379220; x=1782984020;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9sNVNZ83P6g0a7P8tPRt1nDyKQGm49SitMTFhdy7JFs=;
        b=KAPFV1yqyrIBQN1e83zSVoi8sqJ19vp2WiF6eHnmjebRBQHHF01FiKO/sRHiCY4cY6
         KX0u/6llNsK+Cix177CMGciR0rzFck0imtxyMXpBibaDksMeKkBPQkOIywepxOnuphDM
         gA326cb3D6ysR/pCttmjID9Jg8wf/Dp7j5ScCTEsq7IaL6RXxXr6Pr0qmV73Vkn2JkHv
         zhMYPwxRC188KeIetDEbXMBGTTvEkjdZy0GbQz4SwA+V2F++JlMiIzk/s/YNU2MGA1pg
         D61Icp/20lYiAk1jzKxHORytANJrqCUw4vz2VrYkJ1H/LpcsT6RRZIqrJr1Y7mSXYM/J
         yxFw==
X-Forwarded-Encrypted: i=1; AFNElJ8fYoIIng/A9jUJwNq+dQUKnVznYPsN8dYsb91//aIqzo+YRLWhz6BdY6lsffAlsBBLRByh6ne6qcNC@lists.linux.dev
X-Gm-Message-State: AOJu0YyhNh6luuCSLH3n2+qntg/rhWR8/PzHajDPocywg7p014tN7HPu
	E3f/ONPvSmuC86H6x6kx44dmXFJEf+P3P3O84Lw6WA5zm65tGEXMafJf//KHToCDM2VpDAs+qS8
	01mt/uK4BonOPxpcuvaUCjPXZzlIO+Ep5OBoxUubp
X-Gm-Gg: AfdE7cn45xDofoQNYvvrquLuuLGwTABz+dyBLsVL+4Ya2Kj/i1hzpLtCBGBmfY2axCJ
	x5DCKN7Po6SjrDElsRFUOU972CZ7m/Q5dJTdhOkiO48Njv3fOb9uL88MBjRfsixjF31wm5TcK4x
	QqPlNBQOBRDazsDSn2/6JhDWarJZfHSOJnPgWbldfeCE5A1ba3V6xXKk/IhUafbSthsr80JO4Fp
	nMpK+NthDdwN/lPoCI3JP+3TZaV7EnQzkSA/8RRfs4yzsFun5XwYq0xE504VqYMoW79nj2vAg==
X-Received: by 2002:ac8:58cb:0:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-51a6e9af205mr7810381cf.8.1782379219049; Thu, 25 Jun 2026
 02:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-43-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-43-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 10:20:00 +0100
X-Gm-Features: AVVi8CeL3q_KiSPnBQlDtTbHhecm2C_9dXyC0RdNzrEqsxqa92mG6-FntXo0Q6U
Message-ID: <CA+EHjTx3z48aykAeQ36d=pOGEEcChWst9_T5+rOFNcxP3n9vZA@mail.gmail.com>
Subject: Re: [PATCH v8 43/46] KVM: selftests: Check fd/flags provided to
 mmap() when setting up memslot
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

On Fri, 19 Jun 2026 at 01:32, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Check that a valid fd provided to mmap() must be accompanied by MAP_SHARED.
>
> With an invalid fd (usually used for anonymous mappings), there are no
> constraints on mmap() flags.
>
> Add this check to make sure that when a guest_memfd is used as region->fd,
> the flag provided to mmap() will include MAP_SHARED.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [Rephrase assertion message.]
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 0b2256ea65ff9..6b304e8a0e0d5 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -1110,6 +1110,9 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                                              src_type == VM_MEM_SRC_SHARED_HUGETLB);
>         }
>
> +       TEST_ASSERT(region->fd == -1 || backing_src_is_shared(src_type),
> +                   "A valid fd provided to mmap() must be accompanied by MAP_SHARED.");
> +
>         region->mmap_start = __kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
>                                         vm_mem_backing_src_alias(src_type)->flag,
>                                         region->fd, mmap_offset);
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
