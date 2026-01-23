Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB169248886
	for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 17:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769188668; cv=none; b=GTyko/W6gyMRIzk2YKHnRdaWXItB47A04/FTBv5YzEiMwXHuEUGi0HkZhpVlaNoEq3tchhAuI5xvXv7oWr1+F7dCVWYNuf5OH6W1PFobP+kqegF4L3JPla7QRJ6VWnq7qzi/FtQqPmO9PQQ6E87zaAAbKMA37rd+KwfFtyJW0b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769188668; c=relaxed/simple;
	bh=XEuKYMU3yOchzREZZdYCxQAN/c1AbT8tVJqvZScqUq0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ruAvlZ3UvCAmYUGAOLLIe+8RWKhKz0hURJrUTliRn+Zh28KrXviFDpg0GVq7195K6UKS5coib65ZjK6TyiYghKrMaHd1Qsjud+P4byAHtdPHmNYzroB53Z6nMPSys/H+VmB8cIwWDyVSR+0ND/e+nJIndwpDnGogiN/4MDZiimQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yqCLErnQ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yqCLErnQ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a7701b6353so24348275ad.3
        for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 09:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769188667; x=1769793467; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x45fhEbj3h0C2LSTj+jCNFve88XybM2CA/P7gFjNDUI=;
        b=yqCLErnQ2XwuGEM5jH9SOKg3Vv5hjaSOOzPcImUTWjTfo5qIG+kiL2mZLH2TsI+IX0
         rJ5RFOtaerBYUshH5LMTunAMv+MuNXIpIQTL57zE62NfE9BRqfPkrYv2oeE3C4Xf4QzH
         P95kamR5WeRYtw6eK3Vu+X/ce6qgBNdMeDug1jbDUza5qhEV7JNxjQOQrOqhf5yqWM59
         baU3poGT8ig8bWuX32wTf+ocdDo1hC6M7W64811R2eDYu5f7mHeI08WoWN/G5MBq+2Gz
         X0lqOoJlo3A+vcBr3GPus9TiFxRYOER8VRWV+ARym2yUZBcE5XG25h0egB9485BLFCaa
         izzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769188667; x=1769793467;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x45fhEbj3h0C2LSTj+jCNFve88XybM2CA/P7gFjNDUI=;
        b=qIzZenv+sDnzvIAFoqqzK05HOP39DWO7CSAcJH3PkrJnXLEEgm2gThyDvL51yBlgur
         aRZCpjx+g5pyPI4RZUaiI3YVyjJ6BZiaIt4iz6ahm+FUt5L7JsQB+1FJxYZfVopOxoxR
         43LJsFbxw6w1CvehgPsPeoSvuNcQS5dZH2cD69c9wTRNZpJNEVe7J53F3vie8XhsBksd
         SnUO7ByC8gmRX7CqyLpIw8qKUge0XXocz6DKoUCpaJtDZntqBn5/1Ch5tBXTpTb5MlxC
         DwmcvUIw1m+6e9gquPb/BlY1srLN/M/8SKp/z9bUX3thTBsGOis3Sd+MXILIo1XdYRy6
         v/4w==
X-Forwarded-Encrypted: i=1; AJvYcCWP0WqO597cHGEEK1GbBcNgNjEtxsbGO3cqcvB8sdrQ5em+LVAeeqMT43bec95JdAB+9DE56zEnP7R+@lists.linux.dev
X-Gm-Message-State: AOJu0YzEYCbi2pqUcRTz8uQTGb7S4LG+myQ0WFmW7LFy+4vkpsuBdDGu
	Ao9Os2XWjyBLfdcTBtVAXSdOKun1JF/l60twjUT+KPlMIa7RFTpLul/NnY2D+cOXcELn17MU07w
	zQ5iTig==
X-Received: from plzu4.prod.google.com ([2002:a17:902:82c4:b0:2a7:5a4a:5bc0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a4c:b0:29e:a615:f508
 with SMTP id d9443c01a7336-2a7fe6140b7mr31077805ad.28.1769188667228; Fri, 23
 Jan 2026 09:17:47 -0800 (PST)
Date: Fri, 23 Jan 2026 09:17:45 -0800
In-Reply-To: <20260109231732.1160759-2-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260109231732.1160759-1-michael.roth@amd.com> <20260109231732.1160759-2-michael.roth@amd.com>
Message-ID: <aXOtOVrr2SpnGDEg@google.com>
Subject: Re: [PATCH v7 1/2] KVM: Introduce KVM_EXIT_SNP_REQ_CERTS for SNP certificate-fetching
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, liam.merwick@oracle.com, huibo.wang@amd.com, 
	Dionna Glaze <dionnaglaze@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jan 09, 2026, Michael Roth wrote:
> +KVM_EXIT_SNP_REQ_CERTS indicates an SEV-SNP guest with certificate-fetching
> +enabled (see KVM_SEV_SNP_ENABLE_REQ_CERTS) has generated an Extended Guest
> +Request NAE #VMGEXIT (SNP_GUEST_REQUEST) with message type MSG_REPORT_REQ,
> +i.e. has requested an attestation report from firmware, and would like the
> +certificate data corresponding the attestation report signature to be
                                  ^
                                  |
                                  to


I'll fixup when applying.  Thanks for the *fantastic* documentation!
