Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBB93DBD49
	for <linux-coco@lists.linux.dev>; Mon,  6 Jul 2026 20:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783368765; cv=pass; b=tEsksivR9rthXvuphv+Tod8IpT+2TthgZon0/ddUU/ZgQUfe1t7m3+TIyoyCySliG7RdARXuu/8AIATkqNp1SbSaKdN80dsaIdD60quP7Qah3fFJdYdLWL5rccDpS5JPRONzJvGTpZhEBrRnRX26PolWtT7SBHCbKpNb1R6l4NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783368765; c=relaxed/simple;
	bh=tCsl8rppV+5IzTQq6lB9+xMxhNa330FxUZBTap5O0sU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4bTgjwkABwqBAneto2OQ7VgvIK4y1MjlJ2HzqfXNNC5ByjA6T/J7REKfuc9aIdqux2cwjl/MujZe/wcIOBrAhLSrpKD7+zQBiL6zta9hzpecl43u42c1kkqAI6iJRxKUrDq986st25cq8L+FGFMUCetGXdbpCiQg2FuBBS8om8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i53yr4e/; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i53yr4e/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc61541f8cso2971485ad.0
        for <linux-coco@lists.linux.dev>; Mon, 06 Jul 2026 13:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783368764; cv=none;
        d=google.com; s=arc-20260327;
        b=I4ZFzBrKsgyrwzpkESLS+fTcRlKDQj2AVbaEGD0/2qm3i+H7Hyh0xHIyMOxT/LxjCp
         vtN+KvrjFKVJOWRhPFuw/x2txVSogtEfXYmMp2IuVJDt89rlCa/0FcQ5Yoouq5gjZHWB
         guz5EApxJnoalnCiT4/ZPIUnzKXgnHEklZsNrs55Qa2ijctNahUAIPuRzxDsQOh3PAe5
         BLm4wTsMEj6AlR4P90Y2qT0/8q5kJHgoKNwNOrUa30BSM2neZD3ePnJTBd32fw/M35qo
         YXDfV+49HzsaSMqGJqFPuUQaPrkGrFOloiI9pHPFimcKcmx2YhxVwxxzTmiGMNru0DsR
         HkRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=tLsQwaAXDJNDfqHeYJY0yk7pXv8pT0EExTJ4qxzGluc=;
        fh=DHWKwG3Ej1P9qHlpY41N3/y7S5THNmXNssqEo7MJuac=;
        b=Mh3m/TcPxSTBND6vM4nWST4TPAP5REph0qAKmD4RZ1mZyBKGTFzHdD8k2+C7thUUWW
         50vl020focrZUkmmrQ3sdjkn6r6wpVnCoh8G7Y2t2z8LHI0Ic4X57+Ihro7+2uNBaxsc
         LNszcllZ4xqmsTgHAsBnNHkFTKPDOWAiWiRX83SwvGtf1HPjowypF5ZfcIclH1MUUuli
         26LDJVt//qCVqhEDTkkLCKmgIOowW0qSL9pBc09l0E3hBmhOfoMHjJRyAJoDKs6KYo67
         2QHo0ZzJiF42lqh0uiM9sMG6Qt9QaoVTXxrU9PpJomO8WNbr1Xi9wF67raDbHciPWPej
         Wgnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783368764; x=1783973564; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLsQwaAXDJNDfqHeYJY0yk7pXv8pT0EExTJ4qxzGluc=;
        b=i53yr4e/zvFp2kyYD/ptmTNYAUExQreF3jpRHFMStTjhrqFxGLxUEn4D0AZZtJwr7s
         pKhgaiX/aCQB6chQV++HCFITmhj7zNYLGFrpdiMa0e99kudNRXNsz/2FhQXtCiCn07sp
         tdbI1TyvHnOgFgvaG7sfEns7SWWoEP7Dy6tu8fbERas8fSOF0fO5UD5pXE8k5mehDla2
         +MN+vg21dqPqg+9ZZzY9NJn0WPu8UejSpaURTOwFyjESiKLl7hWLynxhoo6cESnTDqDw
         6FnB4VZHqVabzs06xdoGkvXKRkU2MGMBu9J7P3WNTu2HwvQ3pY0AxfWs65oqbYRwrpMW
         RlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783368764; x=1783973564;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLsQwaAXDJNDfqHeYJY0yk7pXv8pT0EExTJ4qxzGluc=;
        b=Pr+VVH+vl0JCRU3x69TQnY2bybDW9iN06GiSJ8nn5q/zaTqOQ/TEHDY834lqECwEY8
         k4pLvCFIsNt6P+TuI9bPvH5K3IZ+lfYKTeCiMhfgrxCDnewZCqVnQy3SZuTYo0lOg1Md
         OGkKw+jc2Ik9BKO3cxFhR83qGy2f5SdojBUsHb7sXt4jzUyZh6FJVj4xLSlkCcYJwt59
         92k2+ecHPFf512/rWBUchiaSIbiBJeawy9T4ZHQsN0iWNoCeghDiI4lLpw5M2uKzFAcQ
         lLAc50KedefQI18PENaXpNbZUWf39m5HHOudMNgimfa02mj4ntHVlECJAxu7LP0h8DJD
         pfmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPnHpjHGFcwjzp50jpagW+2NNtH/7zN5+1BJTR0qtcaLDvwV0Puk/sUDgAvdk5rLGgaFvKWJw4+z2i@lists.linux.dev
X-Gm-Message-State: AOJu0YzXhB6dznvs7Ibkc2xxkZFyVS4Bk1LshfjZTCBkSzcMQat/wdiI
	i7rEK8QlmvMVvhHzWnGzcPBRHY3b4eN1Fv06FFQ2fiGq2accRgkd2tFRW/DYwiZVGS4zknOmhRK
	GBnzUoXVLroUO/b0NciLHFwQNpXneJ9eNE4BAw43w
X-Gm-Gg: AfdE7ckrmc9k1ueYHBh08BjPmJojvQfxUwxl4pm7tjqXZTQeSNuktjPF4o2ydZjbMh1
	F/jHecisxZi5BkztJQSPVwcEx1vsL7F9D9KMi1WM1uxmz/x+d9Ck/Cxum5eu0+xBFRWWu/jRSWz
	9goEG7DBLKZdplkUbZC1z3lxWTC4Wp6YTMIvGbd5hN4qm61HILZkUC52S6qbv4krofJDggSJ76J
	COB06HI32OEhJUUv8UvoH3RoO5VOy8tDIZfU85HqivQLak1/lL0b+kING9b1Z4/QweCEE7KCsR6
	ePjIVSAH0HOgV3AkoMYSHaprEBR75F+70WgQzAWb2dBLed1vbxmq7GpyENQ=
X-Received: by 2002:a17:903:1b2f:b0:2c9:4163:269a with SMTP id
 d9443c01a7336-2cacb070123mr173926025ad.18.1783368763186; Mon, 06 Jul 2026
 13:12:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 13:12:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 13:12:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260327160132.2946114-17-yilun.xu@linux.intel.com>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com> <20260327160132.2946114-17-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 6 Jul 2026 13:12:42 -0700
X-Gm-Features: AVVi8CfMMieKOJ9KWV16RQIgCbb5IZwWCmKGZX-xsr03tKGnv5YmqnGOv8ZZx8M
Message-ID: <CAEvNRgGN=DPP27uMFCmaJu9pAdv4vj=XaG=ofhf1LfiwPZnoGQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/31] coco/tdx-host: Support Link TSM for TDX host
To: Xu Yilun <yilun.xu@linux.intel.com>, linux-coco@lists.linux.dev, 
	linux-pci@vger.kernel.org, dan.j.williams@intel.com, x86@kernel.org
Cc: chao.gao@intel.com, dave.jiang@intel.com, baolu.lu@linux.intel.com, 
	yilun.xu@intel.com, zhenzhong.duan@intel.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com, kas@kernel.org, 
	xiaoyao.li@intel.com, vishal.l.verma@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Xu Yilun <yilun.xu@linux.intel.com> writes:

>
> [...snip...]
>
> +static struct pci_tsm_ops tdx_tsm_link_ops = {
> +	.probe = tdx_tsm_link_probe,
> +	.remove = tdx_tsm_link_remove,
> +	.connect = tdx_tsm_link_connect,

Since .connect is called from pci_tsm_connect(), which is in turn called
from connect_store, is the plan that the VMM should write to

  /sys/bus/pci/devices/.../tsm/connect

to set up SPDM and IDE before starting the guest?

> +	.disconnect = tdx_tsm_link_disconnect,
> +};
> +
>
> [...snip...]
>
