Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF072820A4
	for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 08:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753431838; cv=none; b=WYyyvoGnSbxTHF/nZDOn9C8alArdJfcmV5k05aMVn513ZQjH/7S2+ovYKBz4dheD+QtOfbgF9HtvB+DGLmKKadbjZkds4tfPpL7lJx10i2Ex3y9wn5CgJQUQeQ1mj4+l9cCxprw4NJx1pZke7j1grGRZD0VB8ADueQrwcJemCcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753431838; c=relaxed/simple;
	bh=skfHYZImCEPR8PWUsCYUavnSxBKsiLEfsDiV0RFHlDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mceGFhGEN0+nnI+Hi3lJ3EFLTT3AAKzl40ipP9x3ukkYCwln7+Stp7i8Gwt8yqKent3S1K5/5AL3t9fA/RDNIuILf2atubTvRbjXDKvPZ4VWgmD5IfucOajgxNS77eiGBhMRkq6oqtii9UFA7I5JiXI8alBTfSKOvCaOIQ63NDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IK70Zk/f; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IK70Zk/f"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31a93a4b399so1710366a91.0
        for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 01:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753431837; x=1754036637; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skfHYZImCEPR8PWUsCYUavnSxBKsiLEfsDiV0RFHlDg=;
        b=IK70Zk/fmrE1S9zwM+JQOvJZZpMWG55JD76zp3XrV+SQ++XItB2dIW/5t+DneR4KIy
         cF4cJIfpGVwJVVcnDI0VkaEdo4tsUak3EqVrHcwlMht70QlPrw778PnaSdXgZaN/u1H5
         glUJfz4knoB88o3UHbVT40gpW+ObICgH3qPQZ18608lABh2hguxDw6pLHsGK40plSpKB
         ksXTJBiQu6dQvEXbZRAHaOU2VZrQ+0ZoC9Rkv5tz6TBHKVi7m+t4PkkFKMmKoVf0znMR
         iTLrRvlqloX0fLI5SSgopel29Mx3OpuelIqKWTZtgL2U874ENUIuzHlHD0/3FVKgOcc2
         fi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753431837; x=1754036637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skfHYZImCEPR8PWUsCYUavnSxBKsiLEfsDiV0RFHlDg=;
        b=jjmgvjzjp61JmxUe3nhtYU3SATO+h0Yh6jv7mkzB4wnRDP1qOlK3IVi+i2ImBduyZp
         NqUw+cGimj5GmLUF3tgHOZMKGpduoFoezT8hXCfrZsKatkdG57wxwPnQDp4hqrVGEK8X
         R7kbz8Bt6XTuHfB8lHcwjSPXvsP1CoxBeUB38p+vgCkpb21BswlV28kwBam0KDwTeakq
         zVI7OeEtouIyaFzv66kNIrv1CznffwWHOhP7GrrCifJnsPuDWfXKbI/TE7+P3SLFhSFb
         ln+KpkC3uqMM7jJsksc7O6+MnMVupfa/Zg6M9bTqFqt3PLRei3q504O9UyPRdDtQ3wIZ
         EThA==
X-Forwarded-Encrypted: i=1; AJvYcCWvLBPLzBX9rxk84GKJ53tWNM6fzjEVemArCOZQrBxyc6Ew4PgomnB2WUe8IKDKkNlc6aidL92KSiAF@lists.linux.dev
X-Gm-Message-State: AOJu0YygrEq5q8rOu+O+7eQt5HolH/MoXBCwXyk7e7fv6MdoMmhRFu+f
	LuzbvKJZxEewYxdSsc3eZcS6BrkpFoC6pkHc/wt27QSfUsczPwENUNrXDVyNoGVH4tVU6jW/mOW
	AzwU+qSlhKBg3/7kc4QTGZHAu4SJCPec=
X-Gm-Gg: ASbGncuJ071TQ4Cxwyr+UeWXaGrctwvxF/XzJZqK8b8MtyMbsmdG9xA41Or35b0rPS6
	t0A9D5Hc4r/cPqaxDNcpn9gP0BRoqJ0M4pSKmGkNvLF9RWgm3AMu9Ncy6bk6OHvrPSIlmL7YZMS
	IkMhbJdcTNXuSdudwReVIa833CDef+IUq3NLLtMrD+s6KXpKQyIOPxSLPfJ3AQHwI33EFKFugsJ
	XWq
X-Google-Smtp-Source: AGHT+IF0DLuHKttF43YAHz7O6tHgoNvhE3+8geOKGjB8lYzDiT+qyeGy5nWc+F46EyDWofuUnDxfhsVhLCEV1F6KMlM=
X-Received: by 2002:a17:90b:2751:b0:31c:39c2:b027 with SMTP id
 98e67ed59e1d1-31e765d03efmr1975273a91.7.1753431836653; Fri, 25 Jul 2025
 01:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714221545.5615-1-romank@linux.microsoft.com> <20250714221545.5615-7-romank@linux.microsoft.com>
In-Reply-To: <20250714221545.5615-7-romank@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Fri, 25 Jul 2025 16:23:20 +0800
X-Gm-Features: Ac12FXxL4ULjVNsTL2CjM89TDvywnTWNYgT1ZW-E5i-5hFeFE92-4wgkSmYxtro
Message-ID: <CAMvTesBMgo_u50C5_FwfdqhGy-1k1GhrMP27BL87DTuZ-ZuV+A@mail.gmail.com>
Subject: Re: [PATCH hyperv-next v4 06/16] Drivers: hv: Allocate the paravisor
 SynIC pages when required
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

On Tue, Jul 15, 2025 at 6:16=E2=80=AFAM Roman Kisel <romank@linux.microsoft=
.com> wrote:
>
> Confidential VMBus requires interacting with two SynICs -- one
> provided by the host hypervisor, and one provided by the paravisor.
> Each SynIC requires its own message and event pages.
>
> Refactor and extend the existing code to add allocating and freeing
> the message and event pages for the paravisor SynIC when it is
> present.
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>

Reviewed-by: Tianyu Lan <tiala@microsoft.com>
