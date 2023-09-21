Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB3018C1C
	for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 20:30:02 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59c0eb18f09so19243377b3.2
        for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 13:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695328201; x=1695933001; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0e0ZFX778bRtqensng9uc874c9hN9XH6Wv7cNf/87eM=;
        b=PkeXKM8zsWOball9CxGpMVC7T3CV8w1FBorfpevmLouVLNRB4DyNXVOQrGnNr2qUAE
         YlcnlKflZU/L8sHGVDl6iTQ4zvKPrxfotzQN9OEPRpg7LVuNoFbZ0jsN6hsco9rSdM+2
         uSAir8QtseYLYOVDQnMM2bb4pTgh+6xh1rQ9nA8TmXdKWYfUFZbmI9aVaLN+XSQW5K/H
         dvdl1QPL6pKMPCQlq/Bk97zv/5WlgnWQEpqL32TVyeRGOOiov5C2GFw/MvvFBNIHVv1p
         vT3IZerMxz/L3IW9NH3zeGCOtVjz/XACBCMOEQZlpiZB5ntjU7So1yK8X0NQONfh++PC
         VpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695328201; x=1695933001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0e0ZFX778bRtqensng9uc874c9hN9XH6Wv7cNf/87eM=;
        b=NtmMSedCniHaMWRrjG5ZYALDCdhEhRrRbN97LCIz4B7k2WVPtDSgKxUjUGZwKCVu9b
         zL+sRZRxBSQK9qjfehkWJvre2T7+7WGj6mbz2Zk8wSek2Fs6Kare9v7MfP0qhFdNmE8z
         +KO6+Yckhu9JbYgGBMIDDFu/5djAZINXtAJ4NfcNtEtqGgibDvHrcTREYmHDdq0/iabY
         yhxJaWPCSeoUZYIZtpW0FLALziHa8PhXxUVjWxZf6iYq62BRzJd+3e5s/HuZ9k8ReJTP
         TfSHs+1uTqPDnDqFDEaxzUKWx6xS6PQrw5LC/FnyTxjXvkoPH713R7E613A5sQfjmV1/
         1MJg==
X-Gm-Message-State: AOJu0YxJehtTPhpfyUy4AXuo4z+Q0MnWLC5ntb9KPypWnxHx+XeIdNax
	rtF+kXApJvnG2mTxovr3xrTxQiqRvAs=
X-Google-Smtp-Source: AGHT+IEUzNA8IyQIMX03s7MMZaciANap7xKc1c5smy0hyixgyh595oKa8SQXXUtwQ8+rycDYPZuRHMWlcrs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ad1f:0:b0:59b:db15:a088 with SMTP id
 l31-20020a81ad1f000000b0059bdb15a088mr93304ywh.3.1695328201599; Thu, 21 Sep
 2023 13:30:01 -0700 (PDT)
Date: Thu, 21 Sep 2023 13:29:59 -0700
In-Reply-To: <cover.1695327124.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1695327124.git.isaku.yamahata@intel.com>
Message-ID: <ZQynx5DyP56/HAxV@google.com>
Subject: Re: [RFC PATCH v2 0/6] KVM: gmem: Implement test cases for error_remove_page
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Quentin Perret <qperret@google.com>, wei.w.wang@intel.com, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 21, 2023, isaku.yamahata@intel.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> This patch series is to implement test cases for the KVM gmem error_remove_page
> method.
> - Update punch hole method to truncate pages
> - Add a new ioctl KVM_GUEST_MEMORY_FAILURE to inject memory failure on
>   offset of gmem

Doh.  Please try to communicate what you're working on.  I was just about to hit
SEND on a series to fix the truncation bug, and to add a similar test.  I would
have happily punted that in your direction, but I had no idea that you were aware
of the bug[*], let alone working on a fix.  I could have explicitly stated that
I was going to fix the bug, but I thought that it was implied that I needed to
clean up my own mess.

Anyways, I'm going to hit SEND anyways, my changes are slightly different to your
patch 1 (truncate needs to happen between begin() and end()) and patch 3 (I added
a slightly more comprehensive test).

[*] https://lore.kernel.org/all/20230918163647.m6bjgwusc7ww5tyu@amd.com
