Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F97D192D97
	for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 08:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753431566; cv=none; b=jkJVnFOeBvBLKzhyDiQFKQmNAWC+kVYeUoUKrUzI7oICSteyt+pugtgQm6l7FAzYwWU9vUIJRiq7VagVYGwX+FANm97BgTKEAP8G/mjK+ws1HrD8qMp/3TnHJII6hdTAg3u7/Vkk6NE7A4XEHQWWoOuEwKP0zYg/FVzzfv+cXsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753431566; c=relaxed/simple;
	bh=sy2xJtdA/SBfuji7K5FsjuGqNTI6m2xV98GTAoHdlaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+eApKyP3qp/gRWrVB0/1V4DnWFBq/8duR0cka4t+WoJ/NvvWt/sDm2AqEnXTJGbdoRGBiEoL7jXGtJARVWhR0sxjWlb+uWBBD5JsErh5hCVRFixW+bo5hMWMy3XgewKXwA/SmN1dSxyzsfCwNciIfx6tFvSowsNs8SWu2nSLYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETwY6Vww; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETwY6Vww"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso1662351a91.3
        for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753431564; x=1754036364; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy2xJtdA/SBfuji7K5FsjuGqNTI6m2xV98GTAoHdlaU=;
        b=ETwY6VwweBhFx4ZCZ7OcYoJPugifYM3eMQKTkklSBD2Y1nVQh0o+CqgTXelOmpD9yr
         t+QKWIVpUHPPcu7PINCArkhv6FebOIyg3Mncga3xWqI4qRvk0+rPV5K0q2qBKWJJ5i4v
         a5uD5fhhRkai1DUXLB+/zTjiobPbMnWaM6lna/Wu++2GsSOiIaUPrLjQRjTTHUcjve0N
         Cen+K/5kQRmXzVXCu4sEhagyWajI+hefsATeZG/E2T38ZRcauWMFMDT2FdgEuSvvb/mM
         HRkLSB8PH9m2uUDT+Er9H8bbEH6NPF10iNcksgj/xN6tTr3Bv9YScpxxaXu1MVDiK2Y+
         PKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753431564; x=1754036364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sy2xJtdA/SBfuji7K5FsjuGqNTI6m2xV98GTAoHdlaU=;
        b=FHgxNUg54+XbNioz/STnLiSJ3NfaxypXz4FhzO0V2aNU7st8F97nHWjJRwUBAnrXGg
         qYrFeKtcIs+s2X/WoUK6cbUvipdAoXkl3o4ZFGdsYcEi1oxrkQKfIg+LCpPcStB25S65
         D2DwS1RlOf/t7RemHrh8NxBJRmfe7JeMN8DcdMe7VtEQIISHE2C77LZlrR8Agbgjv5mQ
         /VemEbpQCBckOIEyhBTcACzFM7YiNJ3hTSSE137BmP8IzcINMOlUJpdlHNYqBEaR5Tfn
         KNeYJtVbL4H+c1VWQ9khe5wIaTmFXZdE637M7JBY2hqMK0fhCCiLbh2L25sVjaA2P2uq
         O8ng==
X-Forwarded-Encrypted: i=1; AJvYcCWld15kzB9LZvom0lvwyWWLTHjWfwtR55VJh/0cd3AvBXjWoySxdeuWwJFe5Qt64CwL8BGRT4Tn2Jd1@lists.linux.dev
X-Gm-Message-State: AOJu0YxnbQ1kq5TrnZ1rU5o6ztYVp+oM6jUMFgt5mVvk7A4P+txHzsRW
	jSbF2cfxIzCABwYU+9vzxhjxvXXBbYiBpPZ+1IUlw8okvSSvno48dQi2n8kBD/zXdE+b/1UG6XH
	oNEnxzwuXM8i8qy32osivMznEwINE7KI=
X-Gm-Gg: ASbGncublzXQ4WzTYC7SZkNZlUo6IHsGzN0RhrNhpTkXAWVFjkLl5jDpdTqHFEsMjpH
	hqXHBJ0IK3n63ODCbiyhwIXRWqqWprsJbqBTW87GGYI6YF/ly84f6NKrEY/oYGM87bP2MFuxU2X
	RIQCp4znFXlFMrgcoxccRYle3w64kzdRC0Fej57wLD3pW9rtRQWqM/zvDL0pIDF8vkedZwcgfXI
	d8pChgXJNP/Fx4=
X-Google-Smtp-Source: AGHT+IGgzNGe1EcM8WMPC7m9XVu+3funoe1AvSjNFRR6i7PeY6XfKo0eBJhjkZ/bHAe5BjkPVXOCBAznAQXufu35cdE=
X-Received: by 2002:a17:90b:2e8f:b0:31c:ad57:b97a with SMTP id
 98e67ed59e1d1-31e7785830amr1445568a91.13.1753431564324; Fri, 25 Jul 2025
 01:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714221545.5615-1-romank@linux.microsoft.com> <20250714221545.5615-6-romank@linux.microsoft.com>
In-Reply-To: <20250714221545.5615-6-romank@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Fri, 25 Jul 2025 16:18:48 +0800
X-Gm-Features: Ac12FXwAvdyBnWojo-UU5PSyFhAlYyp43g5iKOGXsvpn4ryJU_iDi-VuMF_onos
Message-ID: <CAMvTesDdCCH5HxaX8yoA0E3OFAQ-bJSJ_LrQezM6pDXx2CTO1A@mail.gmail.com>
Subject: Re: [PATCH hyperv-next v4 05/16] Drivers: hv: Rename fields for SynIC
 message and event pages
To: Roman Kisel <romank@linux.microsoft.com>
Cc: alok.a.tiwari@oracle.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.net, 
	dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com, 
	hpa@zytor.com, kys@microsoft.com, mhklinux@outlook.com, mingo@redhat.com, 
	rdunlap@infradead.org, tglx@linutronix.de, Tianyu.Lan@microsoft.com, 
	wei.liu@kernel.org, linux-arch@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org, apais@microsoft.com, 
	benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 6:18=E2=80=AFAM Roman Kisel <romank@linux.microsoft=
.com> wrote:
>
> Confidential VMBus requires interacting with two SynICs -- one
> provided by the host hypervisor, and one provided by the paravisor.
> Each SynIC requires its own message and event pages.
>
> Rename the existing host-accessible SynIC message and event pages
> with the "hyp_" prefix to clearly distinguish them from the paravisor
> ones. The field name is also changed in mshv_root.* for consistency.
>
> No functional changes.
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> ---

Reviewed-by: Tianyu Lan <tiala@microsoft.com>

--=20
Thanks
Tianyu Lan
