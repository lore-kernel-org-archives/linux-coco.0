Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826D0267B07
	for <linux-coco@lists.linux.dev>; Fri,  1 May 2026 00:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777597109; cv=pass; b=uuFQjwkFo6woSNvlsV6KcOAKmsk/hC6CqYMZujyXXNxDkHNnASI3uYWP+ICsVHVflpAlWDiWhs8sG9cBGV0hSozSGJwXVvIPC0XpGEAa0E697JFvuPqEf4vUY/lQ/sRsula5au7YsWQJPvf/mYEtx25KWpoKhKJJozpYz2V8VtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777597109; c=relaxed/simple;
	bh=fqYlQShHSMRctvGEIU2QmFWw1GV/FMGu+gThhwXZyvQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=beP6ZDZsyN4MufwnQUY2V2xeAkMipKjmugKH9QQFzSL4q4xhj+PJjrZdqmj9+541P1yyDjR+V6AWYyKSUXpMp3Y2XqcXOzXsdqw7LvNKp7ka89KvWNTUT1j+orFl86ls81eBPK3piUGCEfSo6+SO0rQg6apEab76KU8n3+/NQUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UqTVZ/23; arc=pass smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UqTVZ/23"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56dfd007d31so907644e0c.3
        for <linux-coco@lists.linux.dev>; Thu, 30 Apr 2026 17:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777597107; cv=none;
        d=google.com; s=arc-20240605;
        b=lpFYHL+nSSGZD70j1oJsDI8z+rbSFqNh4vRO0p90AQo9oFkBK5J1BehKYxPWNLSm+i
         +btXtM1dJu0Bo06FKY1l7LU8imQwvWusvErRBEc1uSYwCACxyZNDumwqnC3evy5WRzD0
         59TSRNwzv0ywyldDwwEV7CfB03o74xgzmSPMG+Eu6kZTvhKrw5gxZrsmx9xO9BOxoNlF
         nXVhG5qghrtox4gPg0TXuS4pqMhEEXEG2ODTiKYH8jYMPoJo/O+N62WDC2WnN6lli1CN
         0nqCGij1njfbKHyQEwziGxT6jIMQzt5PuqULN3Iqe/cuuOy8wzM3auWryCetU+7qfyw0
         x1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=sH/8kc6iI1JLK2/3TZ78o+aqGZdALyItajE7z4O66hQ=;
        fh=zVzrN9vuUhOmIKyb2OHpRqpeuOdnK9Gbh3QhAThaX0U=;
        b=Wl06I1pefuiAaDuwYnDLJyKyazxVmi2T+kbo/swnpYBp6dQEeVAyzajai7jopXEIU+
         8OwxBZvQ7KOvjQhtkLPm/g5rD1Qr7QQ21sxUq9MdZhMfcZztop52eqgcmPK9kwdNvTj1
         I9qXDe3A/jKJAmUI87GR2yFAgIC24ZaiOP4wMpO+RF4tqyGJe4xdI3bFg87UU4//zXrT
         zRu5wE2zdCEHtRSNRhNCACzxffoRvn6A4t1iQe1vxbHnR6qz2XlOzd+4A4kX+bHPAIGG
         SvZX1mEas4RrCgMYh5KXeMTVl0bwrSwibaNdgBbWdmBhQC6TFL4LjlXgRyAQWXCUxuMI
         gg/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777597107; x=1778201907; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sH/8kc6iI1JLK2/3TZ78o+aqGZdALyItajE7z4O66hQ=;
        b=UqTVZ/23phIZ0IpcxnK585ca7caf9YvxEetmKahDzZPHlWguQf2W6R1t8lFcZEbNnN
         xfabPYjeOhMc/RPihAdSOi08m2y1yEuc94juobsjnUT0tU5AFvKQ3tZ/TXG9XhwSHo8C
         ro6RNMKjgku4kSxAAJ+A5HJd5Qd8xSFr1Jwq4lVrkk7bS2xvsN9iTXeTDBDLakNzNtKp
         rSa1z0qKLY2GbuiU0+HGMmua8ijwCKb86YXArIZVEeBaKXhjJh3TYqXhHXBjyDVrjgi5
         xSLO7Qbjln4iahsmtsCZV06g/PDx1smGEZxZMXJxPa/72bpiz/MtuA5EhA1nUhGlr2c6
         H3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777597107; x=1778201907;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sH/8kc6iI1JLK2/3TZ78o+aqGZdALyItajE7z4O66hQ=;
        b=aUi6mTAP+rYAj20wtzxP2VEE0Cr4t4XB389/kIDyh+fTTHTA46mym3+iXT6zuCJd2T
         WCLNcWzACwpk7uTzkMEzjzoXZIiEBBbysCK1kD4NvbEdQQ9QVah5H2UM/zvFcyc1N2/+
         01zaMHIErp4iSKRc4ZmTDGlWAkALSayRRbmnDAlo84ErssP2wnMX3kXTwduFGTVDR5HX
         5jz7CHEZ+gs3I5KaI5Jcn81rkjYNa3yKHpKoduE/KI5T0z3Iirf2zBAORLY8jzDjDkQm
         cIFqK7+30OGDjEW7QhAesKkff0ExGbspCaIx2sWPTyhucnI6Rr2MWiwCdq+MTTDNPc3J
         4Eug==
X-Forwarded-Encrypted: i=1; AFNElJ8lZCZ8mHTVREmzWznRoKDvoJddMQabuKkW7YobRukF4/A6A8tA0wUHD3jUQgy6fZH7dIjNJtoAwfaX@lists.linux.dev
X-Gm-Message-State: AOJu0YwnkI6woXV7URVsjzXL7vax93KpiAdTGER4XwTOx4CPE0VsH/fW
	kpX+VyN+5EYoonUC9e8In9sEnL6RyMVTWmvqIlqSQP0pBiuV37g5P7A8FCwrJ6af69l8jjYaz2E
	wxKE29pFuM6YaHUWkv4SjTSf2/pRiMhjVdWBB7HOb
X-Gm-Gg: AeBDieuy2xSd1oAe1P+5aWqWi940sD5kJz7/bo0aQTPbxWlAz53sQnBsivcGryxbm3G
	seb0E1gwlur2IAwUGkuIhLxAoZ4yGdwItt68lFVrxC20Mim41jgFvOqTPqPNd1cb0vrHzhYUtfz
	rtZtkSMAvmqd8Yvr6ex0DR+hRnxTiEfIdGnT7IR+ONisBDEJeZFJyDqk/fEPsF69onGIjTB4D/p
	pyJnbHo/EpERUJ2iby7DMxZepfNjdpeMNvhSUXwzSgAeBXMLpRnxfkW5jb9VE6mm68i3pAuqUMa
	CM05aPhcCuKKv9nokTeCEhfPvPDsRZIKtoxzbza92sTpHCjiJsdqrBz0gtpJ
X-Received: by 2002:a05:6122:2a56:b0:567:4e8a:fb13 with SMTP id
 71dfb90a1353d-574bea2b1eamr480295e0c.8.1777597106942; Thu, 30 Apr 2026
 17:58:26 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 17:58:26 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 17:58:26 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <231efd4e9267d3dbb8c63e57b3a43567c965e24a.camel@intel.com>
References: <20260430014852.24183-1-yan.y.zhao@intel.com> <20260430014948.24226-1-yan.y.zhao@intel.com>
 <CAEvNRgGsMaioFvTWaLhnDiLbdx3tunZpo3Qzxdm1xeb4ef0J9Q@mail.gmail.com> <231efd4e9267d3dbb8c63e57b3a43567c965e24a.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 30 Apr 2026 17:58:26 -0700
X-Gm-Features: AVHnY4L-ucZ5s1_gFXeDk_hy8TeRQ49rUaAznyPNkwU0xPAMQzcyCgeetMPMl68
Message-ID: <CAEvNRgHuaztV3_FoRf1UVRDNP-JJ3PJPJgQKANoYOVvg8SjPJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] x86/tdx: Use PFN directly for unmapping guest
 private memory
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"seanjc@google.com" <seanjc@google.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Cc: "Shahar, Sagi" <sagis@google.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, 
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Huang, Kai" <kai.huang@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Li, Xiaoyao" <xiaoyao.li@intel.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"Annapurve, Vishal" <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Thu, 2026-04-30 at 11:17 -0700, Ackerley Tng wrote:
>> Yan Zhao <yan.y.zhao@intel.com> writes:
>>
>> >
>> > [...snip...]
>> >
>> > diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
>> > index b24b81cea5ea..e5a37ea2d4a0 100644
>> > --- a/arch/x86/virt/vmx/tdx/tdx.c
>> > +++ b/arch/x86/virt/vmx/tdx/tdx.c
>> > @@ -710,7 +710,7 @@ static __init int tdmrs_set_up_pamt_all(struct tdm=
r_info_list *tdmr_list,
>> > =C2=A0=C2=A0 * to normal kernel memory. Systems with the X86_BUG_TDX_P=
W_MCE erratum need to
>> > =C2=A0=C2=A0 * do the conversion explicitly via MOVDIR64B.
>> > =C2=A0=C2=A0 */
>> > -static void tdx_quirk_reset_paddr(unsigned long base, unsigned long s=
ize)
>> > +void tdx_quirk_reset_paddr(unsigned long base, unsigned long size)
>>
>> Could this be updated to use phys_addr_t base and size_t size instead of
>> generic unsigned long?
>
> A type is a really good idea. It could look like a virtual address, despi=
te the
> paddr in the name.
>
> I added it to the cleanup list. But I would prefer to keep this series fo=
cused
> on resolving the critical controversy around the struct page/pfn type, ra=
ther
> than adding in more things to debate. If you don't mind.
>

No worries, please go ahead :)

>>
>> > =C2=A0 {
>> > =C2=A0=C2=A0	const void *zero_page =3D (const void *)page_address(ZERO=
_PAGE(0));
>> > =C2=A0=C2=A0	unsigned long phys, end;
>> > @@ -729,6 +729,7 @@ static void tdx_quirk_reset_paddr(unsigned long ba=
se, unsigned long size)
>> > =C2=A0=C2=A0	 */
>> > =C2=A0=C2=A0	mb();
>> > =C2=A0 }
>> > +EXPORT_SYMBOL_FOR_KVM(tdx_quirk_reset_paddr);
>> >
>> > =C2=A0 void tdx_quirk_reset_page(struct page *page)
>> > =C2=A0 {
>> > @@ -1920,17 +1921,17 @@ u64 tdh_phymem_page_wbinvd_tdr(struct tdx_td *=
td)
>> > =C2=A0 {
>> > =C2=A0=C2=A0	struct tdx_module_args args =3D {};
>> >
>> > -	args.rcx =3D mk_keyed_paddr(tdx_global_keyid, td->tdr_page);
>> > +	args.rcx =3D mk_keyed_paddr(tdx_global_keyid, page_to_pfn(td->tdr_pa=
ge));
>>
>> Should mk_keyed_paddr() be updated to have a return type of phys_addr_t?
>> I guess in this case since mk_keyed_paddr() is pretty much an internal
>> function, returning u64 also makes sense to indicate that it should only
>> be used to set 64 bit registers.
>
> Yea, this is used to construct u64 inputs for seamcall args. So I think i=
t
> should keep returning u64s. Maybe instead it would be better to have a fu=
nction
> name pattern that denotes that purpose. We have some more helpers like th=
is
> coming.
>
> But similarly, I'd like to not grow a snowballing cleanup series for this=
 one.

Makes sense, let's go :)
