Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0C33A1A38
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 22:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787956480; cv=pass; b=FtDS5xrL97Lfj85dCkovULux5123ZS161VH0fwVy4pdZy3nahqU2RVWUymKdyeKJ+SsmxUdUX0gJbzdvGuEixIqHaknFT3OytsgnuvUaH+cu1x3P2Dw5GobEkwlCuCGh/qPsYonDN250TXJh6QwXpY0tcYnu+RMva7KxkuAgz0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787956480; c=relaxed/simple;
	bh=LsddL4PRlUTsAeoM7ovykaSIoHJp/TKPnksnw+b4W0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7EDAO/TjXCux/NMJRsqJGF5dmXYmG8DZGF+esVKQ5L4Iru5KpKmHYlZTCTozoQYfMjMlcwucH/giRj34bD5Wp9RSJ4LyHtHe1DeYDLUOKRjB5DiqKofvGr1Bd5YG4l02SYv/BRV7u2dXm6WHlWrpMiQyWsLwXp7AOHaB9JzasU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ky2lqINX; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ky2lqINX"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52fac937235so42101cf.1
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 15:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787956478; cv=none;
        d=google.com; s=arc-20260327;
        b=g3b9mWMh4RKRUeogITiudtEhEWEi4I03fk1Uz9gSF0pGP9FP2MX75shhncFpcpFkdf
         gVtWfQSqiilteqZK4w9JWdc6/b4MadwXa0rQ1a5H1yO65bZV/oiB+bAAAI2BaaD9PAB4
         GvWp+EY41wjbqZRtKcKxQpp0oR1eRDWmo6nwY6vpdSLgfVCe0QRQ8vQskll70M1rfWpk
         mxh9uTli9ohzyy+Pahw+6AeLyydkWNDmT868cJZuiJJjyK3Lar3F7L/+VpKxvB3qIMK0
         cvTaYWDxymES0qSbw/WepL8bR8mD2FnbQQgZJzY7qzwWHZ3R7mPbNmm95CC8psjLX1OW
         0zyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cz3w4vC7ROKvyX2FGhFrH3o4RiUPpew0D579GCON3EU=;
        fh=MBwpa+99TwK9CCOSZjSFhgIycr7NgoIrac3evpbfSR8=;
        b=izFmLgUKntZ8ZtwKaZDtk1IFJfAybEq2wOXLuRPgeuCJMk3IkufQoMJDPvTKdvzPYW
         GiVSgv3LtXS/Jpz2kwYektk/uPGKYaZYzwfKRVOpMZ25ckIXyOIR61R1bUzlUsb2/DuN
         mpc3WRz3CT3kLo6HX3oNN6mJwzXzmbyA2bRsE7zI0NjtATxCWnuYeW8vVIEyEwl5FyMH
         oCYY8jrMMequy9oCCvnL9iKJ/I/1TPfELTbvGsnLyhmH+yi12OX94E9GNfJMPkAh08tr
         x+yg3yWgynEgAK7BQm8wQ3gzIZN8I81Pz2X8sZ4WrYAmaU48HLL+9sPLCo+egCV52p1o
         3odQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787956478; x=1788561278; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cz3w4vC7ROKvyX2FGhFrH3o4RiUPpew0D579GCON3EU=;
        b=ky2lqINX665C3zS3k9K51886GAe+3dQSJW+wIxw20I1e3IYfGnAIiMV4NBoNoYcz/D
         fYyupz3de2FsYBSPH2yWvcS59RInS6PLrjWIBMbDKEGXn3mcoAoXBMrgx9CTSKUc/q6Y
         dWHfuY/XVciHR89xgDGWGo0AyvebtHcvTkwkAFFr8aasVVrU7cLXYWHmoMNBqW4SUuFB
         VYaiA+BvWoog2fnQWeIB0Say4Eu9LLgSDdJsYSChiG6ce9BVWSMd9N7rtGBnR60UR4Ew
         zLtR99VMQ9tJ2zveJ2HmkfblBCifZHvP8rHHpaaECowXjsfeG0NuOIL+kibBUr/ZD1fF
         I0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787956478; x=1788561278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz3w4vC7ROKvyX2FGhFrH3o4RiUPpew0D579GCON3EU=;
        b=QRYo0+s094rWVk/wqLh0zULWck19UnlgHGYIht48DDbxJ+M0MbnDxoYgQT2EXkxMXD
         TiQaQMyoW1htCyTdP4xAUlQ7nbV0JboWD5uXhN/O1nZe4b0eeV4Q8TeIPL/lHgD6M9iE
         NTUdf6kvQyHOO/RSgladaowI+02tPluy+zFZJUZH4kXBZlW6SpL8tCcI1LdD9DOWwPfb
         eHNC7KRcVIYRA2YqrOGah92Sm1j0v9eMJTbesSddA4wGaBQY2Eepm1kkS+nEQANsboW1
         UOO6GqDFrdA60Ljvf5gJHrKJsYf9PL6oB91uQQddhss33Snfdztu/mM9uS+T7BAw/fKq
         +iUg==
X-Forwarded-Encrypted: i=1; AHgh+Rrrt8ATczNq/5P3zJqRae7NbgD2Zw8JyN8oG5gv5tD8iTF53dnzjzXr+hlSXDfGOWJUBe8eQ2Rd4Uov@lists.linux.dev
X-Gm-Message-State: AFuF++nQaZRnYx26b85OceOZWwxBZCOT/mGTV4Myu9stZ2/fxa/BUNIv
	MZGllLkI4jDyzvffFcFvAOlF27xUej24C8S6hLvMs3Ml9Na0RAX3yHhbdfbPBGgo1dtyZ6dPplf
	cHsbwW3jqvKTt7B+j0kPNibxRqcRgj0G10uXezCGX
X-Gm-Gg: AR+sD11o3X/R4svs35sEjoZSxgi/FFjEABsjg1y8VoKH1JB2R8G3rnWLad0JhnCViRN
	qNbrbFJ4UYwa36Iyba3xBElxCMphMRBsIUFpsSVeu8At8T5tIx8dOBaElEiVVEZiojMyvCDF050
	2aNd+AsI81rd04wb+Dirov/IjTi4otQlh5JMV1tCSMKKcUA7+7sujaNFWpCLD4fpigRyXPSgYEa
	yuqu9NMyTEUPFL6ZwduN8e3ONMmBPbOou9xjgYp9ecJkASmHYO7mPr713Ls6rV0nxiqOPljtH0n
	T/MfmVnPJkAddrnrJf9JSXYH3trd2c52CdOq+Z31ttYYfDi7XhUoTvA1IxrxPut+Fu+7dl3BfvQ
	=
X-Received: by 2002:ac8:5d0d:0:b0:528:38d6:71b4 with SMTP id
 d75a77b69052e-52ff73ae215mr4559061cf.11.1787956477427; Fri, 28 Aug 2026
 15:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-9-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-9-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:34:26 -0700
X-Gm-Features: AcwNN1VVNzU9UspnZq9FN__NwaWjASBppoxqnYJM22b0AQZYrchahcz9KPBbKug
Message-ID: <CAGtprH8TceU0x4ivPk23jNGmhKBmJkhu=9YiHw2ibEJZ8gDhpg@mail.gmail.com>
Subject: Re: [PATCH v9 08/11] KVM: TDX: Get/put PAMT pages when (un)mapping
 private memory
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
> Add Dynamic PAMT support to KVM's S-EPT MMU by "getting" a PAMT page when
> adding guest memory (PAGE.ADD or PAGE.AUG), and "putting" the page when
> removing guest memory (PAGE.REMOVE).
>
> To access the per-vCPU PAMT caches without plumbing @vcpu throughout the
> TDP MMU, begrudgingly use kvm_get_running_vcpu() to get the vCPU, and bug
> the VM if KVM attempts to set an S-EPT leaf without an active vCPU.  KVM
> only supports creating _new_ mappings in page (pre)fault paths, all of
> which require an active vCPU.
>
> The PAMT memory holds metadata for TDX protected memory. With Dynamic
> PAMT, PAMT_4K is allocated on demand. The kernel supplies the TDX module
> with a few pages that cover 2MB of host physical memory.
>
> Releases are balanced via tdx_pamt_put(): every control-page free goes
> through tdx_free_control_page(), and guest data pages are put directly on
> the successful tdh_mem_page_remove() path and in the
> tdx_mem_page_add/aug() error path.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [rick: enhance log, reviewing, rebase, with help from AI tooling]
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>
> Acked-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
