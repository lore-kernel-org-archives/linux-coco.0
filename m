Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A912138DC65
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 19:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945499; cv=pass; b=Tb4G4dccmVbHpjqG8/r+LueP3E3j7SVwhqTHBLZIfP+OrAhb/PIQBDdyqnpvwKWc0gA/YBJb3plNB8W0v18OlgOBjAoyIoF3f54q9ztvceYqNRqdF/Vt/v1KErkjojdogbQEgbsq68fFwpGk2Jnkqb1xThpFylOVxQYBvjl4UgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945499; c=relaxed/simple;
	bh=CdWj4WZBsPRTHGep9Z7y+jcoE1QqheNf+EyUKQPri1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlAj4lsuMBaut7DVIYpI5bVWWSYajt0Gjz9S+UVKYFf+wf1TDnkOpK6RtqGA+SOc5wsrS8eeD5FRoNS/TIRs5bIkZoWDIc5duI8vviV7NcPb7boxPvL4DhloUH9htPm6LrcXlWaxd98Iaw2RvLDDfNXP3wWuHYpeSMZdhyUuTWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hEsRw5aN; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hEsRw5aN"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c01c79467so47311cf.0
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 12:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787945496; cv=none;
        d=google.com; s=arc-20260327;
        b=W5T7UO+/d3uSwHd/VJVqTl6Tmc4El/w6x2mBQBWcIo8J/LJgIMg5QUY8fGRb+A53LO
         AOJ9NP/hjaNhycSvkiUY1e4/Fv4TVoxnBlRhHknjpEi698y4ixhTFkbvIPLohhK7MjQ7
         R8t55Wc0Bp6DwB7pUZVwH4WTh5qPHKztIUWdFfeyvZDTWlHSzuGHj4Kld6ZwQvuiKZfs
         v7Qs2sbQ7cL7/TOv36s4X3gXy0PPwe2aKtkI8wam9Aljbn2bn1tyEn2UONUL7Vu59diV
         et5uyYcoDuGpT29mv+nmpgf3263cyrUIHDH0z0qQdhxvVHzoMBTgBJpSVXQ0OBtylNI4
         msrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CdWj4WZBsPRTHGep9Z7y+jcoE1QqheNf+EyUKQPri1k=;
        fh=cuetG9bds+zuBR/ohOTzORKimIRVQa9UydlOQA1F78U=;
        b=SggM7EQt6dy8SDr2AihAQxyhlEhIOXSvvF+YL1J+u02DKDgLdv5gEI/aKtRdIcgCxv
         5l1yI3FK9cCYXW89O/dKfBQDcUKi+Ctmd+hKa8jK+m1P9F/KHi748vnN4I4Sa6qW5mFV
         3R3cTwiee5si2HIWfzccUKI4l0NlmmJ9eggRLzF/aY05/12Lc+IoEI4PVnGQwfQAnNCv
         uuIJ6ThtT7r3x76wgqx1OO/6ssOpxZlH9za2P2QcMKxk6KgEZV3okXkzrkRskVkiplHM
         IELYo1DBVJ6FvrpkBDvatP4MGnUwSVXPK4Lh6W1IiuGNCb9NRdqfKLtsrNoltQX3Hn5t
         Cl2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787945496; x=1788550296; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CdWj4WZBsPRTHGep9Z7y+jcoE1QqheNf+EyUKQPri1k=;
        b=hEsRw5aNdb7OIWTe+ALQ7qQArnrfaKfs/3RFwTjhOlAF0qGQw+/Ait+zpFBF8nsKwn
         YSxt7//95ZC6QHtdi1iuTvRxn8C+SnFin1KXq7I+BYstzOdL58k8bETsAAZxI7V5Jhb+
         4h9z8E7voT72e3UF9z0fhs8YL0PAiQ1gbgzChQFVWu/U89s/HdeWqHjqdEMDGn5ERm8M
         Fi3DFYlR61nE7TC90xxeNh++TkEb8qgcvHVXIzWVKJCQkUB9oYT3262HgOa5GcEFQper
         dpc2Y3XOm0IEKSKSbV3YqP1IHJTbAhT4YCX5PumjhSvUER/rb3JxGic1n7sabQj3FoDb
         utiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945496; x=1788550296;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdWj4WZBsPRTHGep9Z7y+jcoE1QqheNf+EyUKQPri1k=;
        b=KIVpUCg9ZV/yCe5QS4UeDTDkG4ac6E9hl+v88e4MwifF2ie3QKZHiA00RxSpaMDm8p
         NZqpXXDLkYuAUFqTMnzIlI1qxIudDN0jVYHR2nys9wGirETfYhOdBJ6GYqrxH/c4txZN
         7/rMBwQqu4flgglQ41DGOYPpMgiTsPH1EaMwe27vyIKNOpsZCY5tB7VGXHMgBV0bgji7
         +NkjtPrLkLWDv42XWQfrGh1D1UAhGDzACHpCvscFVOTEF4XCRmD8MGwE0WrTLsjpRurA
         /iGcGGKdxJQ+HYiRgEfJbp3drZdxtfnNK+1P615LyY2gIwUabjTIqdRjlZuiaTrojkiG
         lXoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqfg0DST8gd0ToDZmVWwx6lrF8ZUp0jo4srSihJB+V0SM4DUI0LICKUvNRyVhqRJOQyyEJCRFOJy+06@lists.linux.dev
X-Gm-Message-State: AFuF++mbFQ5yBSPYyeYq+ElmDfKNGbtMITp+bKEsPibhulcNYcYkHEGX
	53/LfRyzeIaucNUr/lNa5U+lyB1vTGSKrOHD5tsya/cMrxTk8JyaLbWEop4MOts23n9z/S2slji
	Bznv3s48H7cQI8l6Su4+8KjlOgxQjiu05HTdgf74z
X-Gm-Gg: AR+sD10o4qKKqu9NGsb/5ink78aRnGNhe+h5qiMNs5eaHaMxENr3mLEC0MoflhiA1d7
	WLuoUq/uPHNGvxw9xFS2PEA6UzM0238dCsyW6s5MRWXZL0vn8IYilksnyQv6es5mEzV/RhrXZpD
	JWUzLNeKOgC5lYUCYydXrjVqMSff5uQuKejjHfjUxuxSpSZwkDi/VOBk3Y6TN/KLJ6z2GqvLx0c
	xthC4+HCnos7K74MKYz3raeeHmA1kX8dp1IvW5sgawnt0Lxs3GmC5ycQYHMS7S8hc4eR5fnB/mB
	H2Ay6vGDun0T8jWLpXbSF1pxomQyxW4IqP2uWh6eR1REfPdtMVzVl7cnmf1VNAEQEVTUC6yAy7g
	=
X-Received: by 2002:a05:622a:e3d1:10b0:51b:ff0a:2048 with SMTP id
 d75a77b69052e-52ff716ce29mr1709001cf.3.1787945495743; Fri, 28 Aug 2026
 12:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-3-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-3-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 12:31:24 -0700
X-Gm-Features: AcwNN1WNSpQsijIEuWA2m2XaHo35MQhGxpQjLiFkQcVF5TdNjD6IsdWSCXD5vno
Message-ID: <CAGtprH-qD_P=_GTNmjKbhHk+ep959xcaP0PqUD-KgOv80=OPXg@mail.gmail.com>
Subject: Re: [PATCH v9 02/11] x86/virt/tdx: Allocate page bitmap for Dynamic PAMT
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
> The TDX Physical Address Metadata Table (PAMT) holds data about the
> physical memory used by TDX, and must be allocated by the kernel during
> TDX module initialization.
>
> The exact size of the required PAMT memory is determined by the TDX modul=
e
> and may vary between TDX module versions. Currently it is approximately
> 0.4% of the system memory. This is a significant commitment, especially i=
f
> it is not known upfront whether the machine will run any TDX guests.
>
> Each memory region that the TDX module might use needs three separate PAM=
T
> allocations. One for each supported page size (1GB, 2MB, 4KB). The
> TDX module supports a new feature designed to reduce PAMT overhead called
> Dynamic PAMT. Under Dynamic PAMT the 4KB level is allocated dynamically
> during runtime, while the 1GB and 2MB levels remain allocated on TDX
> module initialization.
>
> However, in the details, Dynamic PAMT still needs some smaller per 4KB
> page scoped data (currently it is 1 bit per page). The TDX module exposes
> the number of bits as a separate piece of metadata than the 4KB static
> allocation for normal PAMT. Although the size is enumerated differently,
> it is handed to the TDX module in the same way the 4KB page size PAMT
> allocation is for normal PAMT.
>
> Begin to implement Dynamic PAMT in the kernel by reading the bits-per-pag=
e
> needed for Dynamic PAMT. Calculate the size needed for the bitmap,
> and use it instead of the 4KB size determined for normal PAMT, in the cas=
e
> of Dynamic PAMT.
>
> The existing metadata reading code was generated by a script, but the
> current plan is to stop generating this code, as the script has continued
> to need adjustments. So add manually written code and adjust the comment
> about it being autogenerated to be more generic. Start to adopt a more
> normal kernel code style without the ternary statements and if
> conditionals assignments that the auto generated code has.
>
> AI was used under supervision to collect/apply feedback, review code and
> workshop logs.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Vishal Annapurve <vannapurve@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>
> ---

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
