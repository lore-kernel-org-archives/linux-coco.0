Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009BC4A3E
	for <linux-coco@lists.linux.dev>; Sat,  1 Feb 2025 02:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738377139; cv=none; b=BHcjemjSSWQnY2Aww+zGocz1HIv7k9U6jqGDZQI9mEVnxnGdAUYpYN5cm8uW9RepKJGpAfLgdaEZ1M+9BdNaX1YhHTwbp7a/5tF01TV0fgUQQ5i2H5Sq6GXTAPsAsyYfyhs+tGcasnFRrV8W4sUDyWpX0P6sOn2rcGWBR44zWqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738377139; c=relaxed/simple;
	bh=YvUJr1IlpMallDUUXqLZIE2yKMx495vfCWgRkrRQMXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4IO8PeeUt3yj1tl81/zWg/Vhys88htzpQh91b3+bu7kO6B3jbtR+msknhSUhmckr675rcyy6CTo/mor9kOYnMa95VJjsTQ2tjrjAu+pfhWKi3fMvpDLd2m4rz/yk5Jwjkhttd6BwKXINMhm0xda7GR9IAoJvcjUHmoNWmjSdP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pcFgg0Qm; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pcFgg0Qm"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e3a2264e1so2977e87.0
        for <linux-coco@lists.linux.dev>; Fri, 31 Jan 2025 18:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738377136; x=1738981936; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG4VfCSV2vZRH8VFu+tXkb/1AcO1THW/axuTYVw/Lrc=;
        b=pcFgg0QmOesFfOz8dY2sul4Q5ddaXH3nw3HINea6v125yeWDUZ/kGYoXzQzl3G6GUL
         0EzeNDiNg2JRbZZ8QE++Gn5Z8U/wxP4tZwi1j6TdXvrVwS9R09YsUa/3A420mWYliGHf
         RFqQCXOq8XdLaZrk79vWV+V1g1NdtezIBiR4QsCVseW5J/cNxEacXH4eJRF8B50ypNMl
         H7WZyl1OfKaPcQ5yjoTyBrscoKUc8hwsd7ysrV1WA3V77igNVBNmspyKJZk8nywa7pwP
         H5tiUXdObOKOmkD2/OQHJRZJ+SPz94wiYJbeGwDmgSuMKOXG8TSSrMTqtQO/y6fYpC8F
         K7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738377136; x=1738981936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG4VfCSV2vZRH8VFu+tXkb/1AcO1THW/axuTYVw/Lrc=;
        b=QCTF+Kv0SgaQUR75Q+4YE1HnmKI0JJCgcMU4rV/qmEF3/mo9PM+OiVQWPOfevxDR3F
         3I/QZorGam/bpUJhcXmfvtMrhATEMcJ7IGjMh8z4zDk+pvV9L12QVmqeeRPqVMZPil/e
         P1/LaYR3qxA38A3P8YQdmPWuUafy/veXP2gLkOCyNNg41EYkPIQxp1iO/X3rYeJXDMR/
         YcloAzsb2f8W5ePm9cU4x0J0elQ+nFi6Y0Z6NCgm5mzT96bmOgnxu4Q/3/HRBkr1C3FG
         Y7rUxj+8OkmOdg+o03QlhJF5p4wQD/LOzu6mli5hK3flUkDQl0h0Ox/TXE7kBUaRZrvs
         YcnA==
X-Forwarded-Encrypted: i=1; AJvYcCWz7Jk0YEjlm7MuSodcuFxUp+wz+P3KbeV46almnvz5OnZ6j/91OdcitYROvcRHe5itwQsJMmgRovwr@lists.linux.dev
X-Gm-Message-State: AOJu0YyTqJ+X3oO+XGGelj8OE3FtHOJlhypVbAWDDcbdsjd7UNa9G51X
	qCLZE3EYlASJWgAkd4XbH8LxWnHYvd6amkZ25LALWNvgCbH6LDt0RnVWRPGpE6Zmbho7irAw94q
	abFTT0u1v3mbZX/Z+rlpKgaca1AQfO9lXQ/ms
X-Gm-Gg: ASbGnctVXSTPx3vtg+6a0lSwK0k2/ZmOcJ5gBa2o/ljlHXu9WkvVXmZideFl/2EQKiw
	m1csCw0IrSdLKWnlRy1Yp7U6N6QZluH0JqlgIbIS4v2OARUHa8ZWtBNOCWkT59iLb+/7QbDdzWx
	sFhKqa0KZZ13K9v+9e74N0+A==
X-Google-Smtp-Source: AGHT+IGDm9JPvGLHbtjFN5gsiaTc6QnwCtkwno/1ZV6/IPpxaNeuuM5xrnBDIsxDQcK/xH+cQ2IfrP7ilTJxIVl7kD8=
X-Received: by 2002:a05:6512:220a:b0:53d:dcde:395a with SMTP id
 2adb3069b0e04-543f6160274mr132911e87.2.1738377135702; Fri, 31 Jan 2025
 18:32:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250129232525.3519586-1-vannapurve@google.com>
 <p6sbwtdmvwcbr55a4fmiirabkvp3f542nawdgxoyq22cdhnu33@ffbmyh2zuj2z>
 <CAGtprH8pJ3Zj_umygzxp8=4sJTdwY5v2bFDhoBdX=-3KQaDnCw@mail.gmail.com>
 <wmdg54v56uizuifhaufllnjtecmvhllv35jyrvdilf4ty4pfs5@y4zppjm2sthr>
 <CAGtprH82OjizyORJ91d6f6VAn_E9LY7WptN-DsoxwLT4VwOccg@mail.gmail.com> <2wooixyr7ekw3ebi4oytuolk5wtyi2gqhsiveshfcfixlz3kuq@d5h6gniewqzk>
In-Reply-To: <2wooixyr7ekw3ebi4oytuolk5wtyi2gqhsiveshfcfixlz3kuq@d5h6gniewqzk>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 31 Jan 2025 18:32:04 -0800
X-Gm-Features: AWEUYZmeERapyJbLH5q17LnS9dbTKeBXAlIs3Ezuwk-Df4kRvcx2vhlD0t9pkOs
Message-ID: <CAGtprH-n=cfH_BJAmiNMoRbqq0XdGCf3RE67TYW8z7RARnsCiQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, erdemaktas@google.com, ackerleytng@google.com, 
	jxgao@google.com, sagis@google.com, oupton@google.com, pgonda@google.com, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 12:13=E2=80=AFAM Kirill A. Shutemov
<kirill@shutemov.name> wrote:
>
> On Thu, Jan 30, 2025 at 11:45:01AM -0800, Vishal Annapurve wrote:
> > On Thu, Jan 30, 2025 at 10:48=E2=80=AFAM Kirill A. Shutemov
> > <kirill@shutemov.name> wrote:
> > > ...
> > > > >
> > > > > I think it is worth to putting this into a separate patch and not
> > > > > backport. The rest of the patch is bugfix and this doesn't belong=
.
> > > > >
> > > > > Otherwise, looks good to me:
> > > > >
> > > > > Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>=
@linux.intel.com>
> > > > >
> > > > > --
> > > > >   Kiryl Shutsemau / Kirill A. Shutemov
> > > >
> > > > Thanks Kirill for the review.
> > > >
> > > > Thinking more about this fix, now I am wondering why the efforts [1=
]
> > > > to move halt/safe_halt under CONFIG_PARAVIRT were abandoned. Curren=
tly
> > > > proposed fix is incomplete as it would not handle scenarios where
> > > > CONFIG_PARAVIRT_XXL is disabled. I am tilting towards reviving [1] =
and
> > > > requiring CONFIG_PARAVIRT for TDX VMs. WDYT?
> > > >
> > > > [1] https://lore.kernel.org/lkml/20210517235008.257241-1-sathyanara=
yanan.kuppuswamy@linux.intel.com/
> > >
> > > Many people dislike paravirt callbacks. We tried to avoid relying on =
them
> > > for core TDX enabling.
> > >
> > > Can you explain the issue you see with CONFIG_PARAVIRT_XXL being disa=
bled?
> > > I don't think I follow.
> >
> > Relevant callers of *_safe_halt() are:
> > 1) kvm_wait() -> safe_halt() -> raw_safe_halt() -> arch_safe_halt()
>
> Okay, I didn't realized that CONFIG_PARAVIRT_SPINLOCKS doesn't depend on
> CONFIG_PARAVIRT_XXL.
>
> It would be interesting to check if paravirtualized spinlocks make sense
> for TDX given the cost of TD exit.
>
> Maybe we should avoid advertising KVM_FEATURE_PV_UNHALT to the TDX guests=
?
>

Are you hinting towards a model where TDX guest prohibits such call
sites from being configured? I am not sure if it's a sustainable model
if we just rely on the host not advertising these features as the
guest kernel can still add new paths that are not controlled by the
host that lead to *_safe_halt().

> > 2) acpi_safe_halt() -> safe_halt() -> raw_safe_halt() -> arch_safe_halt=
()
>
> Have you checked why you get there? I don't see a reason for TDX guest to
> get into ACPI idle stuff. We don't have C-states to manage.

Apparently userspace VMM is advertising pblock_address through SSDT
tables in my configuration which causes guests to enable ACPI cpuidle
drivers. Do you know if future generations of TDX hardware will not
support different c-states for TDX VMs?

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
