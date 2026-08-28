Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED82736F905
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 21:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953756; cv=pass; b=DEYKu4phtUmjKp30TKtDu+80DYNy8alcsXZKNqz1NJ/LDk65AiOcf1wJNU21WgU2Oer7O8Jt2O79wWfraIWThGoaVMF7t+HkDq2bQKf6fDn0ZyfMu8+21IoxUERyCY9/EqsAvG0+y5YEo5D8Z2YKJ4QRHH0jHEG2WvnrMZBodp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953756; c=relaxed/simple;
	bh=NS7ILyNRDwIZOyOLSfg3QhGucIcgXedbcky3j8j+fgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIXiSjgLRZ88PT/H738dvDqzEgrYO5r0KMzLk5SkPOWSzqokTXy5F0AP61scc322F0kTKdMidQTJ/3zSMwfKNhFu6LrI/1hhFh7rzKaWu5/XDA0ECwSaJIuYDnyuerlO7bIzpjQeI//EzeGltygTfOJ1JydUcu/Zl879RBZBelE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Za4RwfIp; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Za4RwfIp"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52fac937235so33051cf.1
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 14:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787953754; cv=none;
        d=google.com; s=arc-20260327;
        b=HfpqGO80nRhhhTwdECXxXzsghkwFH58ROJhrVYbJHEbI+9pa9Lxo3MiqkBd2BiRyzO
         carGlp+4h2ehGs6Np1WE13esO+Yoe8mLwWrSBxW5Yoo0ZSDTB/E7jBPlQT/8NHwUXIvM
         X9qiFRwB/sUoI7GSGuv1aG5sFewwEVJE4p/YiPhkRYq/B5NPjbdZC21M3ZpxpjR4BcBb
         mU6gPIARGNwZcrCTV6ZHi5jr96B0qhg76mXnnf+GpRwcSCFEgQ0ZwVVPEjoq15+rW2sX
         XPSNBspsuSJvu4tEuCDjsrJShb/de7a9RR19ocHHe1DKZKBH/esUH+Lo52mh3dClM2Kc
         CtFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NS7ILyNRDwIZOyOLSfg3QhGucIcgXedbcky3j8j+fgE=;
        fh=/d5qacJmsiiaE0n9yEy5Ap5lkMtr5p7vseLal6KCz/s=;
        b=qNMXpXrurRi9427ubJpYCUO916Q+7DeDeK/C0gnv6vjijkBeu7hZtE2wajRYFhdl0J
         hsDw/L6rlSosZEGJXtA91XUnNpGSGTNxXT7IZTiZ22PrW4J8uOAj2Vurs0Mw4E87h1Nw
         jxMwGkG/U27jzvGUPnYA7gqviBztXc4Tbs26gPzAt3VckxdHj3g2i+DijQZzsBoSxwoc
         VSiVC0KMw5nop9o40kdUitcb5y3ylb13LBw8598aXxeYGLpLy+gWpQOnwS0GZfVdeAg+
         DZGlnn00IU2R4MrqsUM+ivgfojsMpEQAUoltBb8cjzPmu+xu7e8exm6UxBEL64aEe8Yt
         qyHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787953754; x=1788558554; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NS7ILyNRDwIZOyOLSfg3QhGucIcgXedbcky3j8j+fgE=;
        b=Za4RwfIp+7/V3KgBecUdgMDglw/mQ6bWx9LHl/LeWCXMemdeTwURr+Ica4hn7e0iCe
         7KCBCd+uT9S8Gl0MADq0AlwYLMpPuTD0gAJ5PttfKSoTamDancIEBWzCB35l+VPg5DAd
         GcCFtboknTNs6vt+pqCIyBInKPM27mOeZJsSXY5RE78pkTh5k4DlnAGTypCNJDNmlg9D
         liLB7Wcxpm6bFSUVa6Lne103rX2OiPVwT59BclL06STyOZdZQzQ4bl9vgXcRn25SNkGd
         BMwTIQQqP5VMBEFf+eIRpb8mHbpdvsXuyuf9IDSWl2gWFe96xQUiAY+17F0t7G4fucgM
         asVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953754; x=1788558554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NS7ILyNRDwIZOyOLSfg3QhGucIcgXedbcky3j8j+fgE=;
        b=I9s80Fhg4yX8D08sU6nZh5c0j1kFw3NVCkiy//dZ6375ZoUrKOwGgsY4LZ1+mh43Jm
         OS49WX1aXFG7C3G8v2BDJ6mrlYnNUvPPTaWte9g5DvMPVAXZJnY8sv5qR1642nEZ8Vs4
         PU307qNh0Zhi2Z5yfB2OHC3yilA0is866Nt0BIw9cgkdcUw6LOXPrbV8ep4w0fKIspTa
         eljKmaHmoPd+b9hrnr5iJToraOLIdX2sA+6jnnLzufRbjuZKgKOh1BsqoQoQZgkCeYpc
         qVfUD44crPh/UoNt3AZ5vxuTy22NV5hG5Pjbrm/hSZjjHBOvOj+d0keSMYDglgXf0SWg
         8ALA==
X-Forwarded-Encrypted: i=1; AHgh+RrCdMWPzrvttJI/BZ8ElnG9O7e2ucWZB3tcegOYj9SYXfsdphcocNL2obGhFVPv3wRvwBlzt68BwpQM@lists.linux.dev
X-Gm-Message-State: AFuF++kHCcwOKm3TlHgi3lwmkA5o1tSK5vyacNHz4n0Dym6iZycerTUC
	yWeMXYlWB2Q+/ugeL1ukpsGnY2KlhO/vEUn1TgIfoSNFfkYJIlKhByB9+wor4JNgla6Si0JjFke
	0kcvIGqF7qRSy6II+5qVoYg9bRHXEGfbo+8B26/Ot
X-Gm-Gg: AR+sD10jGLS4koyfLCC4HHbHlMZMhGeHSAlex6l9GXNTz6we8GRB0xU9VaTLJrK7MSH
	MoWK0/wWyxmNf54gjby2PQXDgj61kGdjjaKyGIE0Y4MRUGdS0+XR+EbxXwW+CkKLSbEcFDSGTJx
	SNHafFkCBDsS0O6g8g+PqbEgyI6ptqCy6cmLTekd7tVQ8xHzoU5ZI3W1PPHXmfK/S4Yc3LRw9Sa
	kegEOibigNmVPtJXc6PWkNA6OZ1B+RpviAly4VY/HAls/p+cdDZK7jC9QZPp9f/xlu3xpaUJmCy
	KhYkb4BTLqMBLAI+BjxoG+mY1I7MkxAznUtWcYu1PT/l/wU4+UBtcdkknSqAAAmpiUyFDq9ankw
	=
X-Received: by 2002:a05:622a:598e:b0:52d:7a3c:8396 with SMTP id
 d75a77b69052e-52ff6f30c8emr5308471cf.2.1787953753102; Fri, 28 Aug 2026
 14:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-6-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-6-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 14:49:02 -0700
X-Gm-Features: AcwNN1WQxsNINsmJYKS21-W-S3NINHdKdRHcQQhWHhl_kYf3xtibaEfoC6rNsbM
Message-ID: <CAGtprH8Rax32PfiCk54aY_SUPkpfCKYdK5ZKaWJ5-Y8vtFSPng@mail.gmail.com>
Subject: Re: [PATCH v9 05/11] x86/virt/tdx: Handle multiple callers in tdx_pamt_get/put()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> tdx_pamt_get()/tdx_pamt_put() unconditionally add or remove Dynamic PAMT
> backing for the 2MB region covering the passed page. However, multiple
> callers can add or remove 4KB pages that fall within the same 2MB region
> and in that scenario only a single PAMT entry is required.
>
> Make the helpers handle only adding/removing Dynamic PAMT backing when
> required, by refcounting each 2MB range. Gate the actual Dynamic PAMT add
> and remove on refcount transitions (0->1 and 1->0). Serialize the refcoun=
t
> check and SEAMCALL with a global spinlock so the read-decide-act sequence
> is atomic. This also avoids TDX module BUSY errors, as the Dynamic PAMT a=
dd
> and remove SEAMCALLs take internal TDX module locks for the 2MB ranges of
> the specified PFN and the PAMT page pair PFNs. So simultaneous attempts o=
n
> the same 2MB ranges of the PFNs would otherwise encounter an error, which
> would not be handleable in the put case.
>
> The lock is global and heavyweight. Use simple conditional logic to keep
> correctness obvious. This will be optimized in a later change.
>
> The pamt_refcounts[] are atomic_t's. They do not strictly need to be
> because all access is protected by pamt_lock. The overhead of an atomic_t
> in this situation is minuscule compared to the global lock. Leave the
> atomic_t in place to enable future optimization with minimal churn.
>
> AI was used under supervision to collect/apply feedback, split patches,
> review code and workshop logs.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
