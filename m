Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AA6276050
	for <linux-coco@lists.linux.dev>; Sat,  4 Jul 2026 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783175217; cv=pass; b=Z9mIdCP2AXyeRY1IODiLhV/dy0ApxBUPOa8eaUAT46eZlBfFroNm5gtbMV6Uv9yfhyfx4MY9n/nas+pQSvbS3rnK9Q2RbJMJtJb5yR0TpH9Uqi7lzEH2DgOviCTN4Lm6BvKZhbh6/SbTUMhWmOaEX7Fda1B7TnECkocM8A3rhq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783175217; c=relaxed/simple;
	bh=9YDFkrKXe8+xQwIOAGKt+OLc4uyD4YgCdy+nIHJ3u8A=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYBxyebE47W8AZOqgp/plbgNIFIILwcju/2RUkx81/msyTAohy9Gf4cMxfgiAhfI5skOeV9zL5AZyxzmagj6ETPy3OtqFODguWv0UHgYGdFbHXlxPWBt3ZNrcCV3YYy3ZaDJXBvDU4IgxqY5PDu4cLvjf7nItnva3w3Lx2DLvS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S2RHK2Yb; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S2RHK2Yb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ca7aaa4b85so12092395ad.3
        for <linux-coco@lists.linux.dev>; Sat, 04 Jul 2026 07:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783175215; cv=none;
        d=google.com; s=arc-20260327;
        b=qqhRI/pQlCu7klQes07FvCxp25fcIrfZmj89BYV7cylXqf+BSeEit0SGfpZjjTWTcg
         ni34KulrCYOf+khkPRM70QpQIvx0NxehFk9rWXZgMECy0aTjCzWaIImhWNOSstMIWMc0
         WVq1PCkEujxZR/E9QlQrFNJ99mYfLy8WSk3+/+7acJpeC+8nIZpSw4NYqyBEaZ2aQLY/
         uul5G3TObOj9mloAYQWWOwzGYCKnyAuqCLiEQgFeUTXyLii+SmI9Rr6cDFdCJ4ic2il6
         93iQiG52WPeWlaMbu6hEKEkC5fO1cKSJlvaArACa2JjxEVTT8ozuk/mC86HXERr6uqcG
         uFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=WFnktr3xnr1z9FtsyBzXxn1YoZbHM5Izj7pi+H56QNg=;
        fh=EweT7Nm4i+kX1WxFcYRofySgspn/HSNYHDJLK5mfrzw=;
        b=SM5tN8/WQeSul4zoEk6/yeQg129USh8tp12vCUufZ/Wyb3QUFWNN7udjegbzp/up8M
         YSPqEuNhnjnWkoVlfg3iWq2w3hYo4oEjocgKxiRWVmaYwAYx4FGB2O9kogLsSgEis3e2
         3Ne3+wFEr84DST3DMinOWAH22W+CVfzwFhnspYAXxXAJo32rgIxn6dT/VDBUbrjKSFql
         tglI9ohqMLzJLtlsm1CFq7YeiVLghm2wwK4ZI0mRaq49zD2Gw/wlsfMeHSvX58n1zZbD
         eFmkQoPt9E7X6OPnGwRjYj6l1NfKZuL79+9KA3wXIkgp9dmpFG9qf2U7boEjWFHiFBkp
         X+Dw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783175215; x=1783780015; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFnktr3xnr1z9FtsyBzXxn1YoZbHM5Izj7pi+H56QNg=;
        b=S2RHK2YbrGIvfsfPwFYHK9YO2Dc8J4sOenLFQiKsp/+APR4FudKatbJS4BjBgR+BZP
         KK8BpzLRugO7Tps6Xp9tgRCrD0aTfiyFKWlD5xfHlxNfz6Eq6JrLHvJam/iLbYRv+ZYW
         6XJRr4nvNmyoO4GvDAL6hLRMkLJRQFoIatnasV5i7IiaeQpGD5Zcfwlbdv+QxllVSQZk
         +D9t/0C8bN4HgiJEysu04085eMBYbUhyxQSmpx+ZgNJp2yKe7OQGxdSrJQEDx/pOKpJy
         7t2bcPvfVHzOSItbDcSSxdCuhsDqqlo3xn5Xomc++96b/L/7g05DnPIJ9kETdU79tiRc
         MgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783175215; x=1783780015;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFnktr3xnr1z9FtsyBzXxn1YoZbHM5Izj7pi+H56QNg=;
        b=iG5eJd7gopvXnDy6mnm1ML6RnnWEGCZpkxjZ90J+pbo0dTyllxxL9EFJYsE7Vs36Ec
         hx29fjRQHd2oJVmdEr9TjT2vHuDsFrMJJPIgxf8Ieq9xQvzf9XkVv5Q2noqa4U+Pos8u
         XySqpq/2FUVn/4APk6SQ7WQjrHN3uoVCcXYIPKAghFKB7NMgSW/ROuytUnHxdwYVoD1S
         6AksaYSwAmF6Cjtv8rz3sRqeHGMEWSnlVYkeqowGJotnuGaowUEwtRUSc0jomXkw/8sI
         TsCWcUdayQHC7pGtq5oN2XGbNJRqPrAuPBRtj2uTSSyxkYruyL2y8FxOsccB2bQ2jmj7
         VcuQ==
X-Forwarded-Encrypted: i=1; AHgh+Roq3t53hMzUMK4/WmhPcCRJuN78Qzi3JfoZw4WS/9x6WrFrg9jRBKsPELCJcm28mQG0N3tAzxdeZ4sk@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3I264tKxsWkQXlWBYXwljLyLJTP+sYnikxyMQMZkHat94Zno9
	rxKYA5Gr/aWoTTo6Nnm61lW2BAdeiUOKjII6QklbWbeoFycYtGZptoCV9MGuP1vnS1d5Od6+8OE
	4fVNABZdScChtrzSXcmBE+CqCC02mTDYq3HI2Ylly
X-Gm-Gg: AfdE7clQh1y08+Zj45X2YUsK8IiMkqGV2S2QEw0jkgEV5JFc39xd2YlcUIUcocEE0bI
	2aGEHNiBO6C/csj+M4/KIedvb1lpOPMk57oZDDrfzq1czG9N/p3aqAhSY5nCl6Ub9TDJzOEqhJe
	m3wKh8BY8JBZwdlJIDkftPKGwspdsZm+gHZemNlE/hS4lNkotfCteO70wHyrMGKROpM+WCLzpP0
	8xW8YbORPAKR6kamZSlEit5zVap78DiS0B5shjSPmxLDh+8S7oSbV9UpMvDs5+TJP6SGXHNXs/z
	O4Cot7tKQaN48E7kbtPxgJXOOP7XfK8QfnW/wAw=
X-Received: by 2002:a17:903:1ce:b0:2c6:a012:6241 with SMTP id
 d9443c01a7336-2cbb201b39cmr35063005ad.6.1783175214863; Sat, 04 Jul 2026
 07:26:54 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 4 Jul 2026 07:26:53 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 4 Jul 2026 07:26:53 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260327160132.2946114-16-yilun.xu@linux.intel.com>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com> <20260327160132.2946114-16-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 4 Jul 2026 07:26:53 -0700
X-Gm-Features: AVVi8CfdRsR_CKNKNIUlkjPTBxsOwA_Mmn0xqA4DX_E8qDCY3KX5iWgXVn3NJRs
Message-ID: <CAEvNRgHauBdavhq68BepiOpJd1_UmBUQTkfsRmNimZycZ4VW-Q@mail.gmail.com>
Subject: Re: [PATCH v2 15/31] coco/tdx-host: Introduce a "tdx_host" device
To: Xu Yilun <yilun.xu@linux.intel.com>, linux-coco@lists.linux.dev, 
	linux-pci@vger.kernel.org, dan.j.williams@intel.com, x86@kernel.org
Cc: chao.gao@intel.com, dave.jiang@intel.com, baolu.lu@linux.intel.com, 
	yilun.xu@intel.com, zhenzhong.duan@intel.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com, kas@kernel.org, 
	xiaoyao.li@intel.com, vishal.l.verma@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Xu Yilun <yilun.xu@linux.intel.com> writes:

> From: Chao Gao <chao.gao@intel.com>
>
> TDX depends on a platform firmware module that is invoked via instructions
> similar to vmenter (i.e. enter into a new privileged "root-mode" context to
> manage private memory and private device mechanisms). It is a software
> construct that depends on the CPU vmxon state to enable invocation of
> TDX module ABIs. Unlike other Trusted Execution Environment (TEE) platform
> implementations that employ a firmware module running on a PCI device with
> an MMIO mailbox for communication, TDX has no hardware device to point to
> as the TEE Secure Manager (TSM).
>

I'm trying to get up to speed on Confidential IO. Thank you for this
summary!

s/TEE Secure Manager (TSM)/TEE Security Manager/

> Create a virtual device not only to align with other implementations but
> also to make it easier to
>
>  - expose metadata (e.g., TDX module version, seamldr version etc) to
>    the userspace as device attributes
>
>  - implement firmware uploader APIs which are tied to a device. This is
>    needed to support TDX module runtime updates
>
>  - enable TDX Connect which will share a common infrastructure with other
>    platform implementations. In the TDX Connect context, every
>    architecture has a TSM, represented by a PCIe or virtual device. The
>    new "tdx_host" device will serve the TSM role.
>
> A faux device is used for TDX because the TDX module is singular within
> the system and lacks associated platform resources. Using a faux device
> eliminates the need to create a stub bus.
>
> The call to tdx_get_sysinfo() ensures that the TDX module is ready to
> provide services.
>
> Note that AMD has a PCI device for the PSP for SEV and ARM CCA will
> likely have a faux device [1].
>
> Co-developed-by: Xu Yilun <yilun.xu@linux.intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Link: https://lore.kernel.org/all/2025073035-bulginess-rematch-b92e@gregkh/ # [1]
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
>
> [...snip...]
>
