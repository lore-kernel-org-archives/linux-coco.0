Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB275803B4
	for <linux-coco@lists.linux.dev>; Tue,  8 Sep 2026 16:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886715; cv=pass; b=bNij41KPpvZD54k09SXP6LHOqbYAS+caisqRlQj8idB4Xd/aQjVs7eBshvbX/x5GVX1fEd3vDSA9IHGfuFO55yGirnCDgGkaIY+ZZRYpibYhTJN+GOeVvlxAzj/Q8cBiIeVYc+F3vtmbYr9OvuFqye4Ixrz5hxt3MTHRQGk02Xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886715; c=relaxed/simple;
	bh=ULxa4JRrSAZB5pD9oIq2oZNnuuD6C8U1jqAHoElMSdA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ve3FH7YI9dXJiuJ0oNoitej8VZ1PDhCnYZ4YXTeXCgfsVsDhcDkAItHX9HGQ66JGBC81rGQ5A02X9rXUpxcmmVfelJFuA9jbtaIZG9NVBn1HF8gDGrMm+fdOJMfbKQRBC/k2zeNygNwZVUpSIMMdy++jk/9+ISmXpdszjHb2Cgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TNswHSnU; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TNswHSnU"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90ce3971a86so52783676d6.0
        for <linux-coco@lists.linux.dev>; Tue, 08 Sep 2026 09:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788886702; cv=none;
        d=google.com; s=arc-20260327;
        b=kUUp9Lkrq3e5ayGaHMvjoQ0KczzmqrosywvFTZFpQ7ToiBR3iKddc++o1PBdIWv9aK
         Sz+5g9OTqHoNt1RaZzVscSPcMV05YeqHmbdcDoZfhf9k0H5s7XQF8D9uP1AYgiFQUiQI
         zWtdMNbJ/W81TuRj/e4/cwDv5ytM9w0XNS6TxlJgYHpYDhfHESpP0ug9Y+Ajpsq9nKla
         +VRy6Y5shdFbUJOOwgCVNNldCiGAVzcZEH5b7+8DUNruGsXvBpebY5IEtqgyqsg/+HoG
         irZRWDKQAdo4pDC/IxhbBiyxQAQoPDsh8OEeppuNxP5hrI9meTmaaP1ZAADzV3OlRfqo
         qeKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=8fcdr/hrzW8YjLnM5OVm+g395+cNXrG+fCcu71g0lZU=;
        fh=dOaPKpKM4WdGibGUQH9JIqHaGW+PVhvcDuh2Slf58yM=;
        b=k1JRqj6/PysCIoA/nqKUW5bE2sQfbI3vj0EdyA0STvPKcYL07nUThx+DF9GXB6ZPTy
         mjOuycQDNKX9NQSK8aGCX5eNK71Bw0tqh98G8XVfLBhDct1wFvzhLFAFRPUN7iJvrfR5
         CDdXYq80PdQcKtiaQ7JuSrKCrwcT6GGY6l5NqoYIhqt0T3aOuhIpcSk9mcFw0B3b4Hcf
         7ztD6/t9Gc7xQbp5h5SGVF0mWEUQePaCAdltRu+9ynjmTSGATZ8CVFwz+RIUvwkD76L6
         LqPEv/5eKJ2wNwWydcnniC44Z2cOmHYaT7l7XLi1n2sQKoobrvGMcik2+p74sBNzLOQj
         DRqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886702; x=1789491502; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fcdr/hrzW8YjLnM5OVm+g395+cNXrG+fCcu71g0lZU=;
        b=TNswHSnUhRzJZZw8UrtnbIUbaCqEafpwzPBAhshby6CeFeQILRVEoPFE/CBE2uaGDY
         /g5ZTW9PdBGF3NzqRK8EgXgnVi7k68bF6ybLOO4yfVfRF8GYKFe6yAOz2Ww0vvVi+KZ2
         75ihd49ZysR4kB6bRp9zGJfFyQ6R/sUdHtt+klV56+C2rnTOBhHZsuCBFcSzNzw1LjVp
         vsnBC4kF3wDZ+gLU9/eNBF9Jd2gctspyy3xKbL0oY4N1WsFGmGXpZIdYh3suE/WtMhUA
         j4jGQUYxCyhYXwLyXppv6VYKiUotdt/TbEt+wAUcYVuP4ebKC6Zy68gKzgVm+26w8ZYh
         K8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886702; x=1789491502;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fcdr/hrzW8YjLnM5OVm+g395+cNXrG+fCcu71g0lZU=;
        b=LGf94g2yWeGoWN+AyvjYJSeseSYfwXMwyQ1pMY5blsDIBoHO3AtVW8sECLeuzbuGV3
         /UeS/1b4d+sZ4rRDVq2gUhkXGaw8TpzMDkZZwVfWUYd5Dpy+X8bF7jmezN1PDTWXtRo/
         /OJFTJ+qkyOy7PLvhie1qfS2K0w1GZIQ76AB5obsroRC06A2ObTiD8qn7wOkQ9du27D6
         1g8qBKPsjIWsPNRZU3XZRpljUg++jaCuZiLOaKuEDEa7aHNLBcnowYzOIVdjstrt1V7V
         g5I3p6gqparCa9lzIp+C3rYhnd1yw8oclJK3zZfFSI9WWfg8VpMpKpo03XxLdTyrEb5i
         fiuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwICHTqtJFUwcpDkaieOEhICCayvwyJYONDQpdfK8yMI0B+trRJ4wFkAgxl9mZJDyEBPMZB0Vb+qMwD@lists.linux.dev
X-Gm-Message-State: AFuF++l3gSrl9k3TGXlLVUshTjkaNf+Is7Jk79lxlBQn01uFKDWZRIHg
	RbiYEqkVMNpGUVYBB1LIf01jJ8EH+gBMwNjgG4TaIixeS/HndatUnHwLdA0wwE7hq9Q6DwH8AHq
	d2PdvITRRGIvtEl6xDuT2QRmP6qehGxglLX4a4DFx
X-Gm-Gg: AYBFou3EIZCY+9+SXcq/uLC5AnDB/6qVB4LZxgVDU5WmqIvDSGU3TVeibs4EBDSGbw1
	qDoSo4WCegR5gzXBaUuJpdcLPV6eO9gKE4NL3FDIwnQJz3udelWUtjRgHJlnX55G27cwvQvqVB0
	nCAdbZTC43kADryPOfMtaOmN77GJ6rl3ZiFnM9yxNOLPhjsoWatH8pLAdUQCnXgiiaHCisQTbwx
	1WNYzKhwRaSpf+klN89nudgkknYjlNvbCxcSL3OUNRyTy0+G+A00HCZf0bsUOF1VESyayMQDYoa
	Biq6IJ3LTXS8Jl1Yrh2LDmxT3L4EWs+W0wgAyP5lmTnegUXvoamhpHcReCvtD2GZ+I+U211NaIx
	1Tr71FXQPWCnxFhDJ3V+2sC2yPa0i9/s=
X-Received: by 2002:a05:6214:c24:b0:90c:ab32:d9 with SMTP id
 6a1803df08f44-9103ef04cbemr59785766d6.9.1788886701269; Tue, 08 Sep 2026
 09:58:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 09:58:20 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 09:58:20 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260722-tdx-selftests-v14-1-15ad654a50db@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com> <20260722-tdx-selftests-v14-1-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 09:58:20 -0700
X-Gm-Features: AcwNN1Ul0Nx7jhJwVNNvygXIUovvrGXjOMRCxh0xNG50wROb5Y6Vd7rvg4wlMm4
Message-ID: <CAEvNRgFgE3DFw1=zc65iMy1gNyPryVJuKPMrNF+ssXydtuEazA@mail.gmail.com>
Subject: Re: [PATCH v14 01/22] KVM: selftests: Add macros to simplify creating
 VM shapes for non-default types
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sean Christopherson <seanjc@google.com>
>
> Add VM_TYPE() and __VM_SHAPE() macros to create a vm_shape structure given
> a type (and mode), and use the macros to define VM_SHAPE_{SEV,SEV_ES,SNP}
> shapes for x86's SEV family of VM shapes.  Providing common infrastructure
> will avoid having to copy+paste vm_sev_create_with_one_vcpu() for TDX.
>
> Use the new SEV+ shapes and drop vm_sev_create_with_one_vcpu().
>
> Opportunistically move the existing VM_SHAPE() (now __VM_SHAPE()) macro
> below the definitions of VM_MODE_DEFAULT so that all of the SHAPE/TYPE
> macros are bundled together.
>
> No functional change intended.
>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
>
> [...snip...]
>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
