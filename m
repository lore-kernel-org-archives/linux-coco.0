Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF8C19ADA4
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378554; cv=pass; b=Ae0wU0X+rEt7/jdqGP0QxWGSLOYaWlmkkcNVB8C7I9neqR5o3/kn9OfSlQTh0Y3iBTy9lqebMW+YTTyUlwkq6au78tB9umM8+NdKQXNWVUnnjCVvS2h2uEKAg0ruWsioKRzhy4IepJQcq5qZ0tGVnMSLwDw3m2aPADsYOqKvWbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378554; c=relaxed/simple;
	bh=9leBl/vLIM3qHmEH/Edw801DRnY2C/1n405lmvRfXQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEwqRN3t746NYvWE2h/mesd9dzYpEYg5hlsBUHa5YcQQehLRPLTiCRFKJGVHjUeJevjqnOD22DaJfV+jQpq3EqrSWX33s/aUgQr9DtPxcrmhuXYRJC5suiidnwOw/38sC2HpXQOAJ4PSHOp6i74jfS1vqGR8M09ayv47UUg/QYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FkyVO6lB; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FkyVO6lB"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51765331535so159961cf.1
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 02:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782378552; cv=none;
        d=google.com; s=arc-20260327;
        b=QedKGjoALj+639eO2kOPOKBSNR0tgk/gQrtqOarpUd3999yXirZqqXEsojABl3XbWZ
         eypZKRlmQSvS/AL/4ZsS07ggee45i/f0TU0xFehWGGV2vG2MbljtyGODxxsdBh47vyO6
         Svl4GGhLP/Dlsw5XEA9jj1rk0j5corc3Q0Se+wIWEPEi8fE3qwHfTjxkkVjZeunYZrNt
         9L9x5tIOxrmMsdjyK081+IWS096Sm3ZbC7Zt4z33S2JBTijmEHojE6ffZyZq7lqrz5cB
         QuSzUXO0GX3Rc7EX+MfftnuCnkPPBYwYEerqDhkpc26leItbVk01fAdQNxEAhCLpIkrp
         XBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R9slP6pRfRJTNIoqGcM2r5fRlSRzSJ4pkgblOXA4Ai4=;
        fh=aGJrAxfba27dXV73KcBvY4PvDrJ7/at+f4bcVy+p/g0=;
        b=Qq1NzQXJPsJALUo15fbKynNDoEk9G7wqXt8YfRQviA5HsGv27k6PiPnLcaaigr8vAg
         lf/vykFbntcJnikz9zshM6P0eInCqlZRzgS/C6nj5A/rtqfS+LoFzrJGGM1F+JRPK5pD
         8siw/9zLFr3sX0MNt+FQYDwAWz3Bg1CoFyRBo6vUohw916dAlQjCqFksy6WD/j0Z/CCx
         0j4eaNKF85RNSFzds0zrDIll2BWYL3YcD3qYcvQ+LwiQHD8Y+LpjqOT3dsVNxFmdCuQ/
         nqlEVanIUQaTeOh6ADh86kUw901VQuot5qCEwBdFLfyHP470CiVaMs0WsOgmZtqaQodl
         DwkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782378552; x=1782983352; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9slP6pRfRJTNIoqGcM2r5fRlSRzSJ4pkgblOXA4Ai4=;
        b=FkyVO6lBSq6viB1+P+09po1cv+fFsGSr+w/kqrtJSvrs9Ufp3kEE7geZQ36AT2UJ/a
         fkwKZqSWbPQI3P4jCOc+7GTZQXsTMDyjpnrLQZiH+i3OeZvT1Hf3n3cYwla0Ok4N5aaq
         A4ublKHzGy9hcvmnOTfLP+ohx1+YeFDfha+qu87u9jNV6cDGd1T37taFDDcxeJdgA+Cy
         ElkKNqCtOetILnRHStAUbCVJAd51KgCBTKsBEWGYi75yZNmvS1IFQ7paGFFi5dSqjD5I
         xTebM0dQNqmjtRiqEcSIsBDY4rUlcLLoVmrzRGU/+3+DHC5ooC4OIXhMqvZZ6Bp5zteL
         vY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378552; x=1782983352;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R9slP6pRfRJTNIoqGcM2r5fRlSRzSJ4pkgblOXA4Ai4=;
        b=BZg4j8FElx5OON3OSWD3frIol0tt6qQID/w/yYsBpkVW/27JZYqJaSG7pEs3l8OIps
         ErG3tkF8q4nJL7REFwtdFVlhihbJn1/gk8kJkJI8o6JRhW8W/N0hEWA+LtfakKNNyXvr
         oCvF8OdJEVV69fUjN/rHQpM5o02h0XZ1CNvGDvi8Gv4iZlg0+m/V+3KH3mmUa/QZuW8F
         +YRKRGyztMOOdvW/Q7JCEdwxjo1HduMPWOwCDTi+u49IcJYiEYaRsXPuMz1JiP4ihM94
         u6+oX7SbHUri4xAHhT2Pn0hsUE+XJlV/vThJTD6gYNdu5f1lNQKl/Wvve7HkkG9O1Xvs
         eCyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SWrXIGaqZlua77uhKlxJ2/btw3a1H9z7FKtt7b4QWTws/OyuMSKf6L7H8nm9UZvMouaiKELepqiv5@lists.linux.dev
X-Gm-Message-State: AOJu0Yyke00Ui8wtbpoKMOfCn0wKTItqqAwO4wJ7v5YRIO8GJOrmgaEe
	DE28pqkRsrJ9bWm6ltcDp5kA6jfdXTTBIr18BC0djyfkKv/9PkoVHVnGqXbZLP4AvaWvZVy72o7
	W2R73KpYAK1C7p76FnoU0djikzPN11Qbz4iAFTDZo
X-Gm-Gg: AfdE7clZyxoNpcIlkkjzJ/oXE+VR8lyYU5KubfCZUhewkdgc8jtd5ga5kK67Z+9aGi4
	nJ+9P2VMsZdTc67Jflehch+noUgXU0u45rpQSd+i5+PjIP80eiqqtwWUm0rcibsNghipYCg3dDu
	Qi8I0kGxH1AyQpxcYy8hVcdEvF5p/5X28Pk9FUn2ne3NecnjA/p0eM3EKsRIeC/IsY3gfNrxrUg
	7NCBJdXvYSRc4xqvZwZ1zMcEWP+sDHRa7vLHTew7Np6fYs31/NTfG9/bae8eGOCnD2EloPRSA==
X-Received: by 2002:a05:622a:681b:10b0:51a:713c:7444 with SMTP id
 d75a77b69052e-51a713c7d5emr4672591cf.18.1782378551258; Thu, 25 Jun 2026
 02:09:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-42-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-42-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 10:09:00 +0100
X-Gm-Features: AVVi8CetvJC1Xv6WjNcu210fkMycJkdRkSQWNh7yK6lGtnxBBkgdQs08aLwNOyo
Message-ID: <CA+EHjTyHQa2Pmgc=0zf6emtALxAN5f8gUXoV11mShz2qdrqjTw@mail.gmail.com>
Subject: Re: [PATCH v8 42/46] KVM: selftests: Provide common function to set
 memory attributes
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
> Introduce vm_mem_set_memory_attributes(), which handles setting of memory
> attributes for a range of guest physical addresses, regardless of whether
> the attributes should be set via guest_memfd or via the memory attributes
> at the VM level.
>
> Refactor existing vm_mem_set_{shared,private} functions to use the new
> function. Opportunistically update the size parameter to use size_t instead
> of u64.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/kvm_util.h | 46 +++++++++++++++++++-------
>  1 file changed, 34 insertions(+), 12 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 3a6b1fa7f26ef..db1442da21bb1 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -454,18 +454,6 @@ static inline void vm_set_memory_attributes(struct kvm_vm *vm, gpa_t gpa,
>         vm_ioctl(vm, KVM_SET_MEMORY_ATTRIBUTES, &attr);
>  }
>
> -static inline void vm_mem_set_private(struct kvm_vm *vm, gpa_t gpa,
> -                                     u64 size)
> -{
> -       vm_set_memory_attributes(vm, gpa, size, KVM_MEMORY_ATTRIBUTE_PRIVATE);
> -}
> -
> -static inline void vm_mem_set_shared(struct kvm_vm *vm, gpa_t gpa,
> -                                    u64 size)
> -{
> -       vm_set_memory_attributes(vm, gpa, size, 0);
> -}
> -
>  static inline int __gmem_set_memory_attributes(int fd, u64 offset,
>                                                size_t size, u64 attributes,
>                                                u64 *error_offset)
> @@ -532,6 +520,40 @@ static inline void gmem_set_shared(int fd, u64 offset, size_t size)
>         gmem_set_memory_attributes(fd, offset, size, 0);
>  }
>
> +static inline void vm_mem_set_memory_attributes(struct kvm_vm *vm, gpa_t gpa,
> +                                               size_t size, u64 attrs)
> +{
> +       if (kvm_has_gmem_attributes) {
> +               gpa_t end = gpa + size;
> +               off_t fd_offset;
> +               gpa_t addr;
> +               size_t len;
> +               int fd;
> +
> +               for (addr = gpa; addr < end; addr += len) {
> +                       fd = kvm_gpa_to_guest_memfd(vm, addr, &fd_offset, &len);
> +                       len = min(end - addr, len);
> +
> +                       gmem_set_memory_attributes(fd, fd_offset, len, attrs);
> +               }
> +       } else {
> +               vm_set_memory_attributes(vm, gpa, size, attrs);
> +       }
> +}
> +
> +static inline void vm_mem_set_private(struct kvm_vm *vm, gpa_t gpa,
> +                                     size_t size)
> +{
> +       vm_mem_set_memory_attributes(vm, gpa, size,
> +                                    KVM_MEMORY_ATTRIBUTE_PRIVATE);
> +}
> +
> +static inline void vm_mem_set_shared(struct kvm_vm *vm, gpa_t gpa,
> +                                    size_t size)
> +{
> +       vm_mem_set_memory_attributes(vm, gpa, size, 0);
> +}
> +
>  void vm_guest_mem_fallocate(struct kvm_vm *vm, gpa_t gpa, u64 size,
>                             bool punch_hole);
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
