Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F4E125AA
	for <linux-coco@lists.linux.dev>; Mon, 26 Jun 2023 20:54:48 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-666e916b880so1960378b3a.2
        for <linux-coco@lists.linux.dev>; Mon, 26 Jun 2023 13:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687812887; x=1690404887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SLX8BQCbnM9f/rd4hNlD65VtEQzgDwt/qNhvu2U5O+o=;
        b=O7Rlv3HO3y2p/neIeiX+WcXeKkYRkH/Hud4oWFA5Kwnfa7VEzewyTactXTn9BMWagn
         vrgIqVvhLsl3179GwpoERag7EPwtBJrx8guHw0/h9isty9OZtlzTXWOQqt6wIyTK7L3R
         7LqIPfKbIaZELhFwvp7OqI4uMUunijs8eZh9Gk+Iqh0L7jXDE4rrszK08tfI6fWAfYwR
         mFu/EUKnXHMceb/jyadLdvnj1b1saB+NlU3mK3g9cnflr0SBspqYYbUn5HAb2Wmfklcc
         jeCjTeriif9cUxUs9GOkzRl2kY2uRZgfjhurVA0h57pkEFeIUB0RFZT1iPLhwt5Mh3C2
         IV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687812887; x=1690404887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLX8BQCbnM9f/rd4hNlD65VtEQzgDwt/qNhvu2U5O+o=;
        b=GqQ+Wy0yIe3SBK6GyU01k/RmMAq0E/G3CcC9MWTfkcsJ0t4wa2/4d4BvcmSxwFROSo
         Eu1jXLWJzg40py4xFIAeFQfE4SRbUcyHus7ykddtE7yYzuHa1aWIcjRQxCrOIhDrcSts
         P+mJQPPj9ar4qRp7Rjw/Noh1FBZTYKe8Dz18dmlzMUha20HsclkRQcQKFSyYJU2/y7Pj
         uR4GszBhc4yNyJBeZxUv5yd9yHhBRHIz+EKHoyt3awOk/0hN0sq4p/tLb5EDNlZeyHso
         JBTcP4DmUOVtCMt6VB/t11NS/t3DFRi7hE8Ev7NH8sLpQtMhc0Y4r1D7MQovy5ixz4e1
         8+pA==
X-Gm-Message-State: AC+VfDzsKSqWpdOANo6vUSPl5Rzdc4dt3lJOce7tyrC6IGVl2O2RINkH
	rxkhNMDadWM3c6Up9aOYWqw=
X-Google-Smtp-Source: ACHHUZ7QMKlAdDcizoc4NRAdtXPlF4YVpNcKhSVQ4cUkFFQT3MDj4GDlmbTFg4KOOawQON5+rFuebg==
X-Received: by 2002:a05:6a00:2394:b0:668:73f5:dce0 with SMTP id f20-20020a056a00239400b0066873f5dce0mr18699094pfc.29.1687812887340;
        Mon, 26 Jun 2023 13:54:47 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id t16-20020aa79390000000b0065dd1e7c3c2sm4202467pfe.184.2023.06.26.13.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 13:54:46 -0700 (PDT)
Date: Mon, 26 Jun 2023 13:54:45 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, isaku.yamahata@gmail.com,
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com,
	Sagi Shahar <sagis@google.com>, David Matlack <dmatlack@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com,
	linux-coco@lists.linux.dev, Chao Peng <chao.p.peng@linux.intel.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Michael Roth <michael.roth@amd.com>
Subject: Re: [RFC PATCH 0/6] KVM: guest memory: Misc enhacnement
Message-ID: <20230626205445.GD3436214@ls.amr.corp.intel.com>
References: <cover.1686858861.git.isaku.yamahata@intel.com>
 <ZJY0Nudy8ym2kKNg@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZJY0Nudy8ym2kKNg@google.com>

On Fri, Jun 23, 2023 at 05:09:26PM -0700,
Sean Christopherson <seanjc@google.com> wrote:

> On Thu, Jun 15, 2023, isaku.yamahata@intel.com wrote:
> > * VM type: Now we have KVM_X86_PROTECTED_VM. How do we proceed?
> >   - Keep KVM_X86_PROTECTED_VM for its use. Introduce KVM_X86_TDX_VM
> >   - Use KVM_X86_PROTECTED_VM for TDX. (If necessary, introduce another type in
> >     the future)
> 
> How would KVM differentiate between software-protected VMs and TDX VMs if we go
> with this option?

Let's introduce new two VM type.  I'm fine with two new VM types.  I had KVM
capability in mind if SEV implementation doesn't like new VM types.
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
