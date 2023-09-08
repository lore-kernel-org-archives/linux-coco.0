Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167347466
	for <linux-coco@lists.linux.dev>; Fri,  8 Sep 2023 23:57:50 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-273983789adso3283098a91.0
        for <linux-coco@lists.linux.dev>; Fri, 08 Sep 2023 16:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694217470; x=1694822270; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7uIYG+nLope62BZraEl1dGlvLTb6/dt25z9HbvHirJU=;
        b=spnBBvnFdMV5yeb25SHHHpZfuglTLZsY/sk4MOKIPHrsqghJHww4fypRMBo06xbX/e
         clJqQ+C/Ovik6q8R4Cr3IDTmwhS00Qj0MWq0NIYOyWu/5QJWJgx17u58Xn3H9Mm+PO0T
         RTO9s5iQznA2pYi53s/FKJuOfQ+L6ZvxX0+PI8dOpXOqYOgBLRiRU4WjfEkmTIzTACs2
         88WVJ7/T5bpaTIGCtLeMrs1Anc91a8LWw6WsIuMduUwBAJp858aALiG1iLVp2jy8hC94
         qxM4LsJiXLD+7ibEl55IyrBDwPTEwpVC70/FMVRMu82kszk3rNST4AhtQMqZRchaNJHj
         WapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694217470; x=1694822270;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7uIYG+nLope62BZraEl1dGlvLTb6/dt25z9HbvHirJU=;
        b=BxlwJgTD+PWC1QVzKJAiNV05exQ5afXMEN1X2JS5AwIq9IQvx1Kkb52UgIHSzP6uU+
         ZJAC2R4q/Wd9YU1qDElWUP07RZs/llljit2faq51ycmRcNeDOm8PbGwDyMSmQsthbmvl
         J4qs+g/WkjYb+WMtmCGRQ5cSSBP0NbmsV+cMZMRZwQaAZ5PTM6pTI4/zSA3ToDIuFiEj
         HZvkISeSjCupHItSJZ2bSbFpW5afne4P7rPcaoYd3MJLXyygsoKNyeoa05KuBsaUc43i
         eRrQM3GGQHWqbu1/7gm1A/BD3N1/sCNOBi8+CBJiL9/MKUOsu8SbU+IU7mY3XiEzrkm8
         tbqw==
X-Gm-Message-State: AOJu0Yw2I8nijOANhsBbcmnyw8bhwE6+zk44m+wdqArPKUCw8CvZYzVX
	bOtEmVap78ZRRN87/kgX5IXhke6gqOM=
X-Google-Smtp-Source: AGHT+IGOduCypdMHrewnjkwc2pJMM36JJvakmRjZ4E49rexv6nYdn4l7KvNQRhkbNt8CfLhwBJHI+gLk6Cs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:dc05:b0:26d:ae3:f6a4 with SMTP id
 i5-20020a17090adc0500b0026d0ae3f6a4mr981180pjv.5.1694217470364; Fri, 08 Sep
 2023 16:57:50 -0700 (PDT)
Date: Fri, 8 Sep 2023 16:57:49 -0700
In-Reply-To: <20230829132727.ne5xzb7uv2wnrjif@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1689893403.git.isaku.yamahata@intel.com>
 <21e488b6ced77c08d9e6718fcf57e100af409c64.1689893403.git.isaku.yamahata@intel.com>
 <ZLqVdvsF11Ddo7Dq@google.com> <20230722003449.664x3xcu6ydi2vrz@amd.com>
 <ZN/wY53TF2aOZtLu@google.com> <20230826005941.c7gtsootdaod7ek3@amd.com> <20230829132727.ne5xzb7uv2wnrjif@amd.com>
Message-ID: <ZPu0/fxg1E0Yi4Gt@google.com>
Subject: Re: [RFC PATCH v4 07/10] KVM: x86: Add gmem hook for initializing
 private memory
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, isaku.yamahata@gmail.com, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, David.Kaplan@amd.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 29, 2023, Michael Roth wrote:
> So we need to be able to deal with that even for 'well-behaved' guests.
> With RMP-init-during-mapping-time approach I had some checks that avoided
> creating the 2MB RMP entry in this mixed case which is why I didn't need
> handling for this previously. But it's just one extra #NPF(RMP) and can
> be handled cleanly since it can be distinguished from spurious cases.

Just to make sure you're not waiting on me for something, the TL;DR is that my
suggestion is viable and not too horrific?
