Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395E838423B
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350902; cv=pass; b=b2hjQ0Gby3MxXeTBbYMFoFPaFwr5hfVXzYxPxFo2IQG/fPUBjF0TSQKNOrE8xnVpmTY6l+I1p9uu/62GU4I7nnOT8rMhKkRxYnIRGiA5PG9NhwZQZmBAakNzJstoPG1ZzS8OM2HNrNZZk3qE49sGBQUETJKU8fUVHttCTyPvqic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350902; c=relaxed/simple;
	bh=1GakT4SLC90WzEHUaDnF34eVqI2fpwRSLI5kegyTcEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFO9jvzXDUX+RoD5aSZd38Ag1lEFAIhIGzAUXEwE//qgpDs89yUtrH2NlN5GxVhOYM3T2qKcSoOGquXd49Qbd0A+dscRGiEXPDHVZ1RrCFsQq7RcxSIHmJx0ckM1RGMYuoi9tZoRghaiy205lQ0bXQkk03B2dH9FM5EIzZv/sgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b/cEeISi; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b/cEeISi"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50d864c23bdso13181cf.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 01:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779350898; cv=none;
        d=google.com; s=arc-20240605;
        b=X4lA/DhCFpeczbK3EYvnuZbd+N3RkrqS02XnxxA/T55KltOj1wDy03z34qKPdwWEZ8
         Mg+ImJm4Wu6X2fyK8Otw0PFxTqIq17eKNrcrSjKMvlOpw1914+nsvYUSkVRN1JUHZErD
         6DV1VIyWOpAEStzd4MBfkhmVK4GaK6NnyjwAxI1P3kX9Nm/LaTvu5r7WqqvLskRXQ785
         KbifxI5pxxmizue2s1rtKCPay328u0PRfblj56KrlwBNZ21NtlQQhXiP6ZzBq+50ggX5
         TVwI4L2r0ILHgkp05gvoeLwQkw5xbKvFxWT5zX9D9qJr3erSIwt3osKLA4aMdx1blfY8
         ZRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7RmlTBsfZu7jfSANKVaOagnr+/jgA52gkBUY+7wdM10=;
        fh=0kAcLguum1J4+jp5K3Kx/6vLjRmu0wMeM/9ou3iCd6U=;
        b=bH2nDyN6nL5XTH1HGekzbuoAIJ2s/QhfflYLmDZNpLPfqzZAw082IaHKlVSyL0exL6
         YSvUb1nIB9bowG8LjfiQR2S4M/4m91LqdkGxuaAKdoO0qtZX4qk8aSXLQsYIv3OORP4K
         Vc4gziJ5ff4UkeEGyno7OJwViB+HPZibofgLXfrI9xeyWbCOz9zDcr2zQPBQuPaaPaFe
         w885VUp35LhHIYl3LicAliUEIjKjT4ZwotiGI0g9Xa6yUivO1fMYSJubBU7M3bQsLF+e
         tGOrZ4XFMDmTMxeOp8JwM+Z8/ThV+cURbfyVLdMI6dn7Dj1xJzZSkQ9dHlVbXq3fqQur
         V7Uw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779350898; x=1779955698; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7RmlTBsfZu7jfSANKVaOagnr+/jgA52gkBUY+7wdM10=;
        b=b/cEeISig045p3pX/C4bz8KM9qocceaaKLyriFiNEDWdtQ7BF+aUIhj8xbQjF1Lzo7
         FV3Bx0zg2w3ZRgltzfxo3g+td+Sarj31QnJBsQfqU3tVB7Rae7htBO9XhPQg6BP28WzF
         CgYMQuIGkA3p1lmdAByj9LsgugKIj8PRF51fnB0lJ4SEkEHpP1A+1Ddoddh0RORQpopx
         9NnGxvVkgf5y5vdNHdj9YdWjwsM3yUqHh2a+UKQ4OaYcZ1qrVg28gPSEKTmMhjSS42lX
         sgVjR/ACTHPE8J0OrIf/B5qwc/XmqR8AJFOLEmwBSt5B8c1pGCwyBAqZJJV70+FYiwfX
         Ujvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350898; x=1779955698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RmlTBsfZu7jfSANKVaOagnr+/jgA52gkBUY+7wdM10=;
        b=caVtVBxRf2+o9QdWZgghHmKuy8n5gZ+YYZj6+ooM9ofqcDWtwZBKBkrdRQ24bKgjy9
         02kvfYMke9lvco4S9hr/Rw5VBd/5xhRGt06+3ESySl+brIi9qY4UM/JQMdmAis+6UsHv
         eJSBODoAQoJig5kbV0qaixkgVjvAaCPH7ljlQH0jUdfAdgSMdR3xyfyRE7+Xkyy9/DbL
         qak3NsJkiEwa6x725pd3PTP3kOODreyQJzp7I039v7wPDq1USqY6DJc5fZ1GRaHhUPo3
         TTbkTHEiawxPOYdB1uA76GNhZ1WEunrYwY1IlS4450XswQVuaKOTygbmDZFM6Wi5EOsG
         dwcg==
X-Forwarded-Encrypted: i=1; AFNElJ8v6bs+4T8Ejsfem86yN+th5Nlvdd00KMaNZVuaYRccXttXFEXX8dA4JwVNqleqjZwdAfXszEwvWm0F@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+EzlFu2D819WzRQ4datBK0Lg4LNYLlCE+vLiwwTNhCUbHlJDB
	MaZmBvDSkMqsPi/5aGrpQ2t0ObobMkt1gpy8iQlh41b5bD3IVFtf75jegsKfpbuSWBOt6W9q0ev
	lOSoqLXLz6gIlFV+IH6erAAur91fT1k9s1rfhuey6
X-Gm-Gg: Acq92OGiJialdg4GzVpr/zw9WDcfoieuHOtppnN13h2eUeWs0taiP2w/Rsh7k3dxYdi
	V/llv3aPQ1QdqoK3bDjADMYb6mLukwrJzIPjaO90L6DrYcsZSRaeITOgSb3H6rW4Y26MhIT8GcN
	4K5uXdbtVBewA7oWUw3h74cnVJ0i5JuXkOOE+fDP3tSw9lTb2eUpOJvH+e5Edqw0L3+PeeXO1WS
	TPHFqQuEmw7yoSZlxmjiB+dqJuR95GKknDEuya56PU1O/+5twGdiRJqRzIr6a1HQeV7odgYGGNg
	i8AmgGF1pMSGeQrua9A=
X-Received: by 2002:a05:622a:588c:b0:50f:ce97:3b84 with SMTP id
 d75a77b69052e-516c534d1f0mr6941501cf.6.1779350897637; Thu, 21 May 2026
 01:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-18-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-18-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 09:07:00 +0100
X-Gm-Features: AVHnY4K_Cpc3lp6TF05Y1I39E-kRC-mXXncMC4rrkZH8FAVJjZ2CPai0rhLiTAg
Message-ID: <CA+EHjTyiAgmBQgmrAHAHx3G1yKsP7tSgd9r-y4oPKQM4Nn_Kjg@mail.gmail.com>
Subject: Re: [PATCH v6 18/43] KVM: Move KVM_VM_MEMORY_ATTRIBUTES config
 definition to x86
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
> From: Sean Christopherson <seanjc@google.com>
>
> Bury KVM_VM_MEMORY_ATTRIBUTES in x86 to discourage other architectures
> from adding support for per-VM memory attributes, because tracking private
> vs. shared memory on a per-VM basis is now deprecated in favor of tracking
> on a per-guest_memfd basis, and no other memory attributes are on the
> horizon.
>
> This will also allow modifying KVM_VM_MEMORY_ATTRIBUTES to be
> user-selectable (in x86) without creating weirdness in KVM's Kconfigs.
> Now that guest_memfd support memory attributes, it's entirely possible to
> run x86 CoCo VMs without support for KVM_VM_MEMORY_ATTRIBUTES.
>
> Leave the code itself in common KVM so that it's trivial to undo this
> change if new per-VM attributes do come along.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  arch/x86/kvm/Kconfig | 4 ++++
>  virt/kvm/Kconfig     | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 26f6afd51bbdc..b6d65ee664d0f 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -80,6 +80,10 @@ config KVM_WERROR
>
>           If in doubt, say "N".
>
> +config KVM_VM_MEMORY_ATTRIBUTES
> +       select KVM_MEMORY_ATTRIBUTES
> +       bool
> +
>  config KVM_SW_PROTECTED_VM
>         bool "Enable support for KVM software-protected VMs"
>         depends on EXPERT
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index e371e079e2c50..663de6421eda2 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -103,10 +103,6 @@ config KVM_MMU_LOCKLESS_AGING
>  config KVM_MEMORY_ATTRIBUTES
>         bool
>
> -config KVM_VM_MEMORY_ATTRIBUTES
> -       select KVM_MEMORY_ATTRIBUTES
> -       bool
> -
>  config KVM_GUEST_MEMFD
>         select XARRAY_MULTI
>         select KVM_MEMORY_ATTRIBUTES
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
