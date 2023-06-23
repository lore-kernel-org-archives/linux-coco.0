Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FA738A
	for <linux-coco@lists.linux.dev>; Fri, 23 Jun 2023 02:54:32 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-66654d019d4so961307b3a.0
        for <linux-coco@lists.linux.dev>; Thu, 22 Jun 2023 19:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687488871; x=1690080871;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2juHvoY/mcC9iiq57nWmyC1+9+zcIWhH/stlgFuOrU=;
        b=pYEzQadLI48mLv2E3taVm1A3CUWVlYAWQXiyu8DM4jjj+0SwiaHhjQMJzx5D5IxFs0
         cpSlN74mn6Tye6vQ2ArCd1RZxMXLGz9M/+JFzmgFh0l5Xj3t4jGJuybFTfbi39nkSmbs
         YnFv8l/Nb8p37Rfmv2GvAkeh/eUjWBNYrii4IRyDetIIMu4zgq9U6dNA7ZPjEcY8NS+d
         mryz4m5olAt3SrjSuJLizb+lNxErUljkb7RULtHMkBebBop+4NnuP77x5XW9EkG2auQF
         QGKtUOKjO6yw5ET239gNLcxvYOKYTXrYYDNLeFLV3i5kFgXjmEdOapK8PXQx5aPtLshC
         WNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687488871; x=1690080871;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2juHvoY/mcC9iiq57nWmyC1+9+zcIWhH/stlgFuOrU=;
        b=Req1u2JMjokbtW6SqCmguD9msn1sfUxVFFb6DqlQzyulXZP5l0nw4hXCrdpdx2BukY
         VxxL0PcnqRtLvLGft1tfoRh68sBRe8ktBlvozHBaoG6x78ApVKOBK2/AYNHAQ0fez/C/
         g2Tez5rInsO76ah15ihl0YE1KJar1CLMg5HAYo0Qg979o0LBQS/mHe19dgiNFi4VTP8p
         O+Qn01dgiS75Gmhu3rYJl3eyzfT+d40qM7SqHGIg6JW4AZll7iFiJxz/R07IDM/xma+p
         W1ShbafjuqS4K/OQUOpaOV2hM42Uwn73IbgKA0jDL0BIPPSagFppobbNcVRx73xVV/Zj
         JulA==
X-Gm-Message-State: AC+VfDwC08v+DDXcNhhS1zOLhQtP+DQRIP9wvNeKWT9if/woy+fQ90YY
	Pti+3sMRIZ2JnflC8UkCS9E=
X-Google-Smtp-Source: ACHHUZ5JJ2k9e9xfcKcc1NjbpAw2nX2k3oA3LDDnRxY6qZDvpS0ZU1fCwskxROcZ6ZRXfW/QBXkd1Q==
X-Received: by 2002:a05:6a21:900c:b0:10b:6b1f:c8c8 with SMTP id tq12-20020a056a21900c00b0010b6b1fc8c8mr18587734pzb.31.1687488871379;
        Thu, 22 Jun 2023 19:54:31 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id k4-20020aa790c4000000b00652c103d534sm5088322pfk.118.2023.06.22.19.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 19:54:30 -0700 (PDT)
Date: Thu, 22 Jun 2023 19:54:29 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>,
	"michael.roth@amd.com" <michael.roth@amd.com>,
	"Annapurve, Vishal" <vannapurve@google.com>,
	"Christopherson,, Sean" <seanjc@google.com>,
	"ackerleytng@google.com" <ackerleytng@google.com>,
	"Chen, Bo2" <chen.bo@intel.com>, "Shahar, Sagi" <sagis@google.com>,
	"isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>,
	"Aktas, Erdem" <erdemaktas@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"dmatlack@google.com" <dmatlack@google.com>,
	"zhi.wang.linux@gmail.com" <zhi.wang.linux@gmail.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>
Subject: Re: [RFC PATCH v2 3/6] KVM: x86/mmu: Pass round full 64-bit error
 code for the KVM page fault
Message-ID: <20230623025429.GB3436214@ls.amr.corp.intel.com>
References: <cover.1687474039.git.isaku.yamahata@intel.com>
 <b659f86ac7128965e05a7a660c38734667530fc0.1687474039.git.isaku.yamahata@intel.com>
 <37b868c53c9f35e8ec051573562a4598df38d72d.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37b868c53c9f35e8ec051573562a4598df38d72d.camel@intel.com>

On Thu, Jun 22, 2023 at 11:28:22PM +0000,
"Huang, Kai" <kai.huang@intel.com> wrote:

> On Thu, 2023-06-22 at 16:16 -0700, Yamahata, Isaku wrote:
> > The upper 32 bits of error code are discarded at kvm_mmu_page_fault()
> > by lower_32_bits().  Now it's passed down as full 64 bits.
> > Because only FNAME(page_fault) depends on it, move lower_32_bits() into
> > FNAME(page_fault).
> 
> I haven't looked into the code yet, but the last sentence around
> FNAME(page_fault) doesn't make a lot sense IIUC?
> 
> For instance, we can have a shadow EPT table when EPT is enabled in L0 and
> exposed to L1.  If we want to pass 64-bit error code to the handler, how can
> FRAME(page_fault)() depend on the lower 32-bit value? 

Probably "depend" was too strong. In short, I wanted to not change the value
passed down as error_code from FNAME(page_fault).

FNAME(page_fault) calls helper function to walk page tables. Some check
PFERR_IMPLICIT_ACCESS_MASK(48 bit).  If we don't mask lower_32_bits(), it can
pass accidentally the bit.  Maybe we can audit the code carefully to check if
IMPLICIT_ACCESS bit doesn't matter or fix it.  But I don't want to do it with
this patch series.
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
