Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E30E281369
	for <linux-coco@lists.linux.dev>; Wed,  8 Jul 2026 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518521; cv=none; b=Cv9+n38whgHhDUgs3ZHOVeqT5hbZ1MNOEKNcsuR9d/iYV3zSz4SZ4lYmT8vR4crfdj8foVbf4Wd14u21Tl2BsmENPtFREQ4qYYWqVYKqgXoFT0t0hGkR0fXub87q0kjlgKNX1Hmy2+grrRH7X1shWcm+NVnTTITq0Ez8GfzRbdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518521; c=relaxed/simple;
	bh=Q5Qk0KHQjVZbp0lFmVKnGWZtxtkKr3ZAe8XmELX1/6o=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=PTI4Q9TixTIIBZ/K9mY8tIjhMx1hl8/XjjRy6qmF4OBsCIlRSKQU9SDKD1ODn1DfKFpNG+KQtTIyrDea3dlzVumPuSK8ik+uIPzsuAfO2oqoVERiKctL9Vm5RIqVMacbIPIrDQKUeHaXSQtmoRaeeBYWpEbFpdgLvAHdk4Wm7ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nq3taXGu; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nq3taXGu"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso501770e87.2
        for <linux-coco@lists.linux.dev>; Wed, 08 Jul 2026 06:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783518518; x=1784123318; darn=lists.linux.dev;
        h=content-type:mime-version:user-agent:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bzsuqGeu2ZztC5uiYt7ZwxUJKrCKRdPms1njvftvolk=;
        b=Nq3taXGu70vhf1bfTms1NkS8XpcfNdnMtErhXqJ2Qiu8eTKPut+s9u3DCIjWnNI9sa
         Q6Ad1RUJQY2Ta1uM/xJ7JOJ3skrwmJcuUDkdcip10JOiojIJIVWcD91dKE/zO6gT6mB8
         jrYCklT+05KtW+It/rZ/LoiQGQ2nKZH+snHKD+k+/4mc8Do4HgtMjpwleQnqdo8aXpkG
         bWFsbK9svoUyeI1VQHNmN/i6F9ZJTevaU2J5ClWFGyUCT9IYgIjiBvjbGyU6p2atkHdw
         EH+A6Og+35e3Y3JbqiaM0LfuHMS8UI++7lJgYffRCytJAHjZFuBeWdBszMxv7yhuF36O
         7xDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518518; x=1784123318;
        h=content-type:mime-version:user-agent:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bzsuqGeu2ZztC5uiYt7ZwxUJKrCKRdPms1njvftvolk=;
        b=GbZZ+SxPdUgFRLlr1godGi/V5doXpKsgv8y8QZrn+4bzSsJGL1BrL2F1TdTjc+OR7q
         PVE6253GTgkyZSaBPPplGA6dfj1mPIf7dwhrEcK+peuq1hfXaOFlcR2kXsry/Oa2v49l
         MYEnnYCckjtUp/Ihf/5GQ7UFAyYFe+Djt3k+enTL/FPzC9yytDjG1s3kx05Ijdkp6/X4
         Qf534DZoSPmx3o0TswQkbSpqiTsAEcTpnX6Hyr1CGo3JGYKCemZxrmDvuhDi1rpNagsc
         VJD97jaSms7zk//3uFwqJ/S/pitBb51qdQwssZwLjPqnajkoQlWfMR8+CDNRKB9duWHU
         rUMA==
X-Gm-Message-State: AOJu0YxJslWMP9ZHMhMM/v4BGoZ6FxTNI43vVDpttstwcXLKeJRV0iHv
	BaEl1LLcS4oNorl+x1bCKx2+xrUpV+81RkoRCIceoh2m3l0sbLMWWyLD
X-Gm-Gg: AfdE7cnCxaKVkzvxIOcLdtvfigkR41gAFg9KwmoQST0N0xTsyuII4bA/3Tfc9/5tZrz
	paQpIIcnIIVi3x+D4zx4R/CDg3rlR9PLD3+h82zU4A/xaYDFw1jLeRGfx/6soaW6FnaK46nhU4G
	sWv+o0K829/DbKhMInhA0rhepuzcjfoIS31ZlN+k/Xq2g42dAaYBFB71ao/ir05/Uq53quiIgf4
	Y3xeKIJsnT8iZLvjKYoAuGcG3+nX4XB59sNXyPRuC8q4H4NjQR150XWBm7feNAdcA5JTLugIhiS
	W6OjnVO+D0dTpD3qtDC8Pq3TYloLFqnyIS7Dd9VL8tzv1EvsxetjP+FRmuhJSDMi7Z76nKF3k7r
	1jelPV7dp9Y4/WeXCnC+sCga3P6po7MQeRZ/o+Ipcj8cDwy1xV9ee1zcD7XsFDx8BPIt3rk/9SO
	YnrWdZd5zD7BsuiFHOTPPX2UY4ZqFFj6jQO3lVRKpocmnzlhx7
X-Received: by 2002:a05:6512:66da:b0:5b0:eda:de34 with SMTP id 2adb3069b0e04-5b0114ad7b9mr525977e87.43.1783518517539;
        Wed, 08 Jul 2026 06:48:37 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:eccc:7ea2:9458:892d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8dcsm4528257e87.11.2026.07.08.06.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:48:37 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Dan Williams <djbw@kernel.org>
Cc: linux-coco@lists.linux.dev,  linux-pci@vger.kernel.org,
  driver-core@lists.linux.dev,  ankita@nvidia.com,  Alistair Francis
 <alistair.francis@wdc.com>,  Lukas Wunner <lukas@wunner.de>,  Jakub
 Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 01/15] netlink: specs: Introduce multi-message blobs for
 SPDM
In-Reply-To: <20260705220819.2472765-2-djbw@kernel.org>
Date: Wed, 08 Jul 2026 12:13:57 +0100
Message-ID: <m2y0flbuoa.fsf@gmail.com>
References: <20260705220819.2472765-1-djbw@kernel.org>
	<20260705220819.2472765-2-djbw@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Dan Williams <djbw@kernel.org> writes:

> The SPDM, Security Protocol and Data Model, underpins PCI device security
> and other use cases. It defines objects that allow for verification of
> device identity and configuration. These objects can be large in size 16MB.
> Netlink is otherwise suitable to define the operations, with optional
> parameters, and notifications for working with these objects. For example,
> operations like "regenerate evidence with nonce", "mark evidence
> validated", and "broadcast evidence / security state change events".
>
> A netlink 'blob' is introduced as a way to teach YNL that one instance of a
> attribute may span multiple messages. It enables netlink to convey all the
> data needed for verification and manipulation of SPDM transported evidence.
>
> The schema change to allows YNL to infer that an attribute may span

change to allows -> change allows

> multiple messages and interrogate its length to preallocate an
> appropriately sized receive buffer.
>
> The design direction to extend the netlink schema for a "multi-message
> object receive" case was the result of this discussion [1].
>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Donald Hunter <donald.hunter@gmail.com>
> Link: http://lore.kernel.org/20260318170014.6650d2bf@kernel.org [1]
> Signed-off-by: Dan Williams <djbw@kernel.org>
> ---
>  Documentation/netlink/genetlink-legacy.yaml | 6 ++++++
>  Documentation/netlink/genetlink.yaml        | 7 +++++++
>  Documentation/netlink/netlink-raw.yaml      | 7 +++++++

I suggest you drop the changes to genetlink-legacy and netlink-raw
because I don't think we want to support the blob functionality for
legacy families.

Can you also update Documentation/userspace-api/netlink/specs.rst to
describe the multi-attr / bloblen API behaviour.
