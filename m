Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30069490BEC
	for <linux-coco@lists.linux.dev>; Sat, 12 Sep 2026 18:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789237505; cv=none; b=GJzAKD9ivoeOp1laT91+S0g1SnXbtmK37KPVAfFAvKc1dMciU/nuNAtydJIyBonxz2AQAmnrObdQ60Rc2K5voIleCGEy04qxCBJ1PwYA5OZjChAzzZfxB+qIYvRWa2Vqtc1Rinop2xkivEKEThk2q0HCj6X1blSg2+51t8sMkEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789237505; c=relaxed/simple;
	bh=eLqP1N7b6tjfnDc7NPeEHRrOtb9yw8j+gizAmdXem1A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dCu0FEgFYUxrxuQcAC7Hp3u0BNtNtga9js1RNhKqsrskA1/IVmiJPtn0hoY5FPjwzhM0T4oeXuNj7oB+pcyrWxwx4V1KbiWno0TZ81m3zXe2O4b9x67wRNPi5NqYgI9QRFoRkzbZNRKnJ3H+jbAvi8/bzrGjNp5R/To+4UPGsf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gF42G9ed; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gF42G9ed"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4902427c1so1642758a12.1
        for <linux-coco@lists.linux.dev>; Sat, 12 Sep 2026 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789237503; x=1789842303; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fB9Rvvh0XNSKgjOKB5u1fxCWt8XLxe3grlwpz5bxPOg=;
        b=gF42G9edYmur29/+WkAYgD5Omiov2I2VZKXJytsKnUVWnozi26nbav02XCMjyUftIg
         ekc+2EFyxs+wDCzMczheKiTjr1271mo1PLhmV6kIyGYL0ScA48yKXnt28vKoFgq+yX50
         LArJQxzZDdX3Go1pvBel7iL7CSLF7QduGwPKVp05lyGHXgwBEemCHIrKk4iST1lMijts
         2nRzLa8hYABMq4+fwaHQbyski5frNmEjbOG1LPlKtaNVOZglmGnic1kK2o14DBBF7Lf0
         dMN51wJxFRpez9fGCD8pyq3rb9AegsLZkvGuM3FWQF86fiiObuhm3RZQ2DC7I+yUNSWK
         COFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789237503; x=1789842303;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fB9Rvvh0XNSKgjOKB5u1fxCWt8XLxe3grlwpz5bxPOg=;
        b=MMx8HA3YOH3+xpjkDB6iKh1s6kCCnjoTLk1mG5seXGXX3xapHVV/lSXmOUqcN0k6Ul
         BncFu+LubWDOW3nE9VEvSap5685a7qQ+q0s8YgSQRXCf7IIgGeVsM/Kc0g03agEVyaRU
         +yfWqsJteO9lihRAF75Id7hjC5ioSQKg8EJYpqPanPC2Eg+Htv+OXPVhtJZrHPEnrLKx
         oLNbkXcWOgm6RVQAuu9YSX0T83gDiPXlZyM5DTbSWSQnWjdcxFNAnDABaRAqM49Foee9
         FuInk4aIF10BYwpMnUBtJdcipvtZDJA+W/0tpVbEbyHziQShpepV17mW7murGkdkeU55
         uedg==
X-Forwarded-Encrypted: i=1; AKwUvBxL+l0SpG7oBDcimz2icIXhPUqiEcyoLyzYDY2LnIlS2BtcevBZwfRURiIpgB3MbduOq8DeLVJ6GzA1@lists.linux.dev
X-Gm-Message-State: AFuF++ngXYnQFUKsVg5SgMyEhlRoVDWd6reTBUgM1GvlNdjCylskt9qH
	R44x1KCVdo00D56+RbZ2OikHR65Z2a0U1QtRJVsaJY1fV2vqrZrm069E
X-Gm-Gg: AYBFou3YN/N4DRaLM9hqDA51VZ27JbqY9im0ThGyGQckdLzzmmcYOWzy7tQOXna5cHm
	d0g3a92EuR0K1RKHY0weFP0YeP0RbYUum0UtAtfviK+djUwigoc5hZgUv1Omi4L3GxWrAbqdqzI
	Btp6y94hLD32FkgLoUU8cfnDCYaghXecQogG7Yvgwr4+378pVsGimT4v/W4TvYusKga2n1seJW5
	dIhzDEL3DZNTpyeKX7u1kxafu17Lw3ktMVzbLC2mLLLhQ4nQ38Ja69Q/BOqTi02pOAjNnS8R9g0
	IZmSuLsq+595NrGuXxI+hr4ZGfQkYVgpcaI5tuPQTWWHOFvInnSQ/OeIbBOFeZ0Q4StL+VbGInR
	GCq7nVZdZRFMPz18ztwQArvcEYgDNCwlZs8oVKw4YlY/VuUArtmC9gLkhSdMFeO7WTMw5svYkDG
	1Zp/vTRvp9q+/9LxIzNsyhMWQCftnQKBOk9p7DhozcBi9NNSwdrZFaThE1Zr+JCwzRGT0nXbikY
	jY1T7AFWcbn56DlmFItRg4=
X-Received: by 2002:a05:6a21:138c:b0:3da:11e2:b36c with SMTP id adf61e73a8af0-3dad295a03amr18550192637.27.1789237503261;
        Sat, 12 Sep 2026 11:25:03 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm17018961eec.17.2026.09.12.11.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 11:25:02 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	x86@kernel.org
Subject: Re: [PATCH] x86/sev: Do not fail SNP platform init if the vTPM cannot be registered
Date: Sat, 12 Sep 2026 23:54:54 +0530
Message-ID: <20260912182454.2292590@gmail.com>
In-Reply-To: <aqJoJBNEpyKpKKix@sgarzare-redhat>
References: <20260821053411.1215497-1-gokul02k@gmail.com> <aqJoJBNEpyKpKKix@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: reply.sh

> I'm opposed convert to an error message, but honestly I don't understand
> which problem we are fixing.

Only an inconsistency: no vTPM returns 0, a failed registration returns
-ENODEV, both leave sev-guest registered, and nothing reads the return
value.  The failure itself should not happen in practice and I am not
arguing otherwise.

Happy to drop this if you would rather keep the -ENODEV.

Thanks,
Gokul

